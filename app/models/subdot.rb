class Subdot < ActiveRecord::Base
  # Podtacka
  belongs_to :dot

  has_many :paragraphs, :dependent => :destroy
end
