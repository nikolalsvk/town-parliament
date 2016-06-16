# == Schema Information
#
# Table name: subdots
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string
#  dot_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe Subdot, type: :model do
  it { should belong_to(:dot) }
  it { should have_many(:paragraphs) }
end
