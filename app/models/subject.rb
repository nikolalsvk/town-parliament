# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :string
#  regulation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Subject < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Predmet
  belongs_to :regulation

  has_many :clauses, :dependent => :destroy
end
