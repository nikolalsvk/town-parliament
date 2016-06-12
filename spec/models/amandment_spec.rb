require 'spec_helper'

RSpec.describe Amandment, type: :model do
  it { should belong_to(:owner) }
  it { should belong_to(:user) }
end
