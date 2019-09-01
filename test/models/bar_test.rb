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

require 'test_helper'

class BarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
