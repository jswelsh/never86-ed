# == Schema Information
#
# Table name: bottle_readings
#
#  id           :bigint           not null, primary key
#  fill         :decimal(5, 2)    not null
#  reading_time :time             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  bottle_id    :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_bottle_readings_on_bottle_id                   (bottle_id)
#  index_bottle_readings_on_bottle_id_and_reading_time  (bottle_id,reading_time DESC) UNIQUE
#  index_bottle_readings_on_user_id                     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (bottle_id => bottles.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class BottleReadingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
