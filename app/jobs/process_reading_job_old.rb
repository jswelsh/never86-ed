class ProcessReadingJobOld < ApplicationJob
  PYTHON_SCRIPT_PATH = (Rails.root / 'vendor' / 'python' / 'process.py').realpath
  DETECTION_CLASSES = [10, 11, 12, 13, 14, 15, 16, 17, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0].freeze
  queue_as :default

  def perform(bottle_reading)
    image_file = Tempfile.create
    image_path = image_file.path
    image_file.binmode
    bottle_reading.photo.download do |data|
      image_file.write data
    end
    image_file.flush
    image_file.close
    output = StringIO.new('', 'w+')
    errors = StringIO.new('', 'w+')
    pid = Process.spawn(
      [PYTHON_SCRIPT_PATH.to_s, image_path],
      redirection: {
        in: :close,
        out: output,
        err: errors
      }
    )
    pid_status = Process.wait pid
    [ output, errors ].each { |io| io.close_write; io.rewind }
    output_str = output.read
    error_str = errors.read
    unless pid_status.success?
      Rails.logger.warn("Failed to process reading for #{bottle_reading.inspect}. Error from script: \n#{error_str}")
      bottle_reading.failed!
      bottle_reading.save!
      return
    end

    result = JSON.parse(output_str)
    fill_index = result.find_index(&:positive?)
    fill_value = DETECTION_CLASSES[fill_index]
    fill_pct = fill_value.to_f /  bottle_reading.bottle.liquor.capacity.to_f

    bottle_reading.fill = fill_pct
    #bottle_reading.reading_time = Time.now
    bottle_reading.complete!
    bottle_reading.save!
  end
end
