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

class Liquor < ApplicationRecord
  validates :spirit, presence: true, uniqueness: { scope: %i[brand name capacity] }
  validates :brand, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cost, presence: true, numericality: { greater_than: 0 } 

  has_many :bottles
  has_many :bars, through: :bottles
end
