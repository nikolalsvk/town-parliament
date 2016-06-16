# == Schema Information
#
# Table name: acts
#
#  id         :integer          not null, primary key
#  preambula  :text
#  name       :string
#  state      :string
#  city       :string
#  date       :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe Act, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:heads) }
end
