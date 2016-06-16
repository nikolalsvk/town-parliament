# == Schema Information
#
# Table name: heads
#
#  id         :integer          not null, primary key
#  name       :string
#  category   :string
#  act_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe Head, type: :model do
  it { should belong_to(:act) }
  it { should have_many(:regulations) }
end
