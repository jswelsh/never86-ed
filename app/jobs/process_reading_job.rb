class ProcessReadingJob < ApplicationJob
  queue_as :default

  def perform(bottle_reading)
    Rails.logger.info "TODO: interpret picture for bottle reading #{bottle_reading}"
    bottle_reading.fill = rand(100.0).round(2) 
    bottle_reading.reading_time = Time.now
    bottle_reading.complete!
    bottle_reading.save!
  end
end
