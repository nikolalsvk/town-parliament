# == Schema Information
#
# Table name: subdots
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string
#  dot_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subdot < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Podtacka
  belongs_to :dot

  has_many :paragraphs, :dependent => :destroy

  def act
    dot.act
  end

end
