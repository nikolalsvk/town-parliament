# == Schema Information
#
# Table name: amandments
#
#  id          :integer          not null, primary key
#  date        :date
#  type        :string           default("wait")
#  content     :text
#  explanation :text
#  rating      :integer
#  owner_id    :integer
#  owner_type  :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

RSpec.describe Amandment, type: :model do
  it { should belong_to(:owner) }
  it { should belong_to(:user) }
end
