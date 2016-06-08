require 'spec_helper'

RSpec.describe Subject, type: :model do
  it { should belong_to(:regulation) }
  it { should have_many(:clauses) }
end
