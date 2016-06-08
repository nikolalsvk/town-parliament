require 'spec_helper'

RSpec.describe Regulation, type: :model do
  it { should belong_to(:head) }
  it { should have_many(:subjects) }
end
