# == Schema Information
#
# Table name: heads
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :string
#  act_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Head < ActiveRecord::Base
  # Glava
  belongs_to :act

  has_many :regulations, :dependent => :destroy
end
