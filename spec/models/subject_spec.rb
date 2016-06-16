# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :string
#  regulation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

RSpec.describe Subject, type: :model do
  it { should belong_to(:regulation) }
  it { should have_many(:clauses) }
end
