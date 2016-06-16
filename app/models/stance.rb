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
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Stav
  belongs_to :clause

  has_many :dots, :dependent => :destroy

  def act
    clause.act
  end

end
