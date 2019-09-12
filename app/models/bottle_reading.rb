# == Schema Information
#
# Table name: bottle_readings
#
#  id           :bigint           not null, primary key
#  fill         :decimal(5, 2)
#  reading_time :time
#  status       :integer          default("pending"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  bottle_id    :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_bottle_readings_on_bottle_id                   (bottle_id)
#  index_bottle_readings_on_bottle_id_and_reading_time  (bottle_id,reading_time DESC) UNIQUE
#  index_bottle_readings_on_status                      (status)
#  index_bottle_readings_on_user_id                     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (bottle_id => bottles.id)
#  fk_rails_...  (user_id => users.id)
#

class BottleReading < ApplicationRecord
  belongs_to :bottle
  delegate :bar, to: :bottle
  delegate :liquor, to: :bottle
  delegate :organization, to: :bar
  belongs_to :user

  #has_one_attached :photo
  enum status: %w[pending complete failed]
  validates :user, presence: true
  #validates :photo, presence: true, on: :create
  validates :bottle, presence: true, uniqueness: { scope: :reading_time } 
  validates :reading_time, presence: true, uniqueness: { scope: :bottle }, if: :complete?
  validates :fill, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, if: :complete?
  
  after_commit :queue_for_processing, on: :create

  def queue_for_processing
    ProcessReadingJob.perform_later(self)
  end
end
