require 'exifr/jpeg'
class ProcessReadingJob < ApplicationJob
  queue_as :default

  def perform(bottle_reading)
    exif_data = nil
    bottle_reading.photo.open do |f|
      exif_data = EXIFR::JPEG.new(f).to_hash
    end
    exif_comment = exif_data[:comment].strip
    fill_pct = exif_comment.gsub(/%\x00?\Z/, '')
    
    bottle_reading.fill = fill_pct.to_f
    bottle_reading.complete!
    bottle_reading.save!
  end
end
