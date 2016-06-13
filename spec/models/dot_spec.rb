require 'spec_helper'

RSpec.describe Dot, type: :model do
  it { should belong_to(:stance) }
  it { should have_many(:subdots) }
end
