# == Schema Information
#
# Table name: bottles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bar_id     :bigint           not null
#  liquor_id  :bigint           not null
#
# Indexes
#
#  index_bottles_on_bar_id                (bar_id)
#  index_bottles_on_bar_id_and_liquor_id  (bar_id,liquor_id) UNIQUE
#  index_bottles_on_liquor_id             (liquor_id)
#
# Foreign Keys
#
#  fk_rails_...  (bar_id => bars.id)
#  fk_rails_...  (liquor_id => liquors.id)
#

class Bottle < ApplicationRecord
  belongs_to :bar
  belongs_to :organization, through: :bar
  belongs_to :liquor

  validates :bar, presence: true, uniqueness: { scope: :liquor }
  validates :liquor, presence: true, uniqueness: { scope: :bar }
end
