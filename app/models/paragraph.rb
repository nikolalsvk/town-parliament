# == Schema Information
#
# Table name: paragraphs
#
#  id         :integer          not null, primary key
#  content    :text
#  name       :string
#  subdot_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Paragraph < ActiveRecord::Base
  # Alineja (paragraf, pasus)
  belongs_to :subdot
end
