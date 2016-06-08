require 'spec_helper'

RSpec.describe Paragraph, type: :model do
  it { should belong_to(:subdot) }
end
