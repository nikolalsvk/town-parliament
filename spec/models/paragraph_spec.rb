# == Schema Information
#
# Table name: paragraphs
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string
#  subdot_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe Paragraph, type: :model do
  it { should belong_to(:subdot) }
end
