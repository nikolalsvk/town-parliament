require 'spec_helper'

RSpec.describe Subdot, type: :model do
  it { should belong_to(:dot) }
  it { should have_many(:paragraphs) }
end
