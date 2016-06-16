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
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Odredba
  belongs_to :head

  has_many :subjects, :dependent => :destroy

  def act
    head.act
  end

end
