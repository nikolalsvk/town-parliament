# == Schema Information
#
# Table name: dots
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string
#  stance_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe Dot, type: :model do
  it { should belong_to(:stance) }
  it { should have_many(:subdots) }
end
