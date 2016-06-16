# == Schema Information
#
# Table name: stances
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string
#  clause_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stance < ActiveRecord::Base
  # Stav
  belongs_to :clause

  has_many :dots, :dependent => :destroy
end
