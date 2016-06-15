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

class Dot < ActiveRecord::Base
  # Tacka
  belongs_to :stance

  has_many :subdots, :dependent => :destroy
end
