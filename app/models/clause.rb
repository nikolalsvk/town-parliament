# == Schema Information
#
# Table name: clauses
#
#  id         :integer          not null, primary key
#  name       :string
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Clause < ActiveRecord::Base
  # Clan
  belongs_to :subject

  has_many :stances, :dependent => :destroy
  has_many :amandments, :dependent => :destroy
end
