# == Schema Information
#
# Table name: stances
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string
#  clause_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe Stance, type: :model do
  it { should belong_to(:clause) }
  it { should have_many(:dots) }
end
