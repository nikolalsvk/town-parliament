# == Schema Information
#
# Table name: meetings
#
#  id         :integer          not null, primary key
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Meeting < ActiveRecord::Base
end
