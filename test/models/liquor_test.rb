# == Schema Information
#
# Table name: liquors
#
#  id         :bigint           not null, primary key
#  brand      :string           not null
#  capacity   :integer          not null
#  cost       :decimal(5, 2)    not null
#  name       :string
#  spirit     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_liquors_on_brand_and_name_and_capacity             (brand,name,capacity) UNIQUE
#  index_liquors_on_spirit_and_brand_and_name_and_capacity  (spirit,brand,name,capacity) UNIQUE
#

require 'test_helper'

class LiquorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
