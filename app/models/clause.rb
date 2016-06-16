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
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Clan
  belongs_to :subject

  has_many :stances, :dependent => :destroy
  has_many :amandments, :as =>:owner, :dependent => :destroy

  def act
    subject.act
  end

end
