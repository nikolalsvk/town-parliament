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

class Regulation < ActiveRecord::Base
  # Odredba
  belongs_to :head

  has_many :subjects, :dependent => :destroy
end
