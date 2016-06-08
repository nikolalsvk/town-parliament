require 'spec_helper'

RSpec.describe Act, type: :model do
  it { should have_many(:heads) }
end
