# == Schema Information
#
# Table name: clauses
#
#  id         :integer          not null, primary key
#  name       :string
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe Clause, type: :model do
  it { should belong_to(:subject) }
  it { should have_many(:stances) }
end
