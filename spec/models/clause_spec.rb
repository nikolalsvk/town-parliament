require 'spec_helper'

RSpec.describe Clause, type: :model do
  it { should belong_to(:subject) }
  it { should have_many(:stances) }
end
