# == Schema Information
#
# Table name: regulations
#
#  id         :integer          not null, primary key
#  name       :string
#  definition :text
#  head_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe Regulation, type: :model do
  it { should belong_to(:head) }
  it { should have_many(:subjects) }
end
