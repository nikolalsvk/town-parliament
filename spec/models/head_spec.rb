require 'spec_helper'

RSpec.describe Head, type: :model do
  it { should belong_to(:act) }
  it { should have_many(:regulations) }
end
