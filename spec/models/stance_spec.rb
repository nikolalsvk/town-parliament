require 'spec_helper'

RSpec.describe Stance, type: :model do
  it { should belong_to(:clause) }
  it { should have_many(:dots) }
end
