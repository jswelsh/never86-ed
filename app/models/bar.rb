# == Schema Information
#
# Table name: bars
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_bars_on_name_and_organization_id  (name,organization_id) UNIQUE
#  index_bars_on_organization_id           (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#

class Bar < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :organization_id }
  validates :organization, presence: true
  belongs_to :organization
  has_many :users, through: :organization
  has_many :bottles
  has_many :liquors, through: :bottles
end
