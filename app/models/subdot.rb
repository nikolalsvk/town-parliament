class Subdot < ActiveRecord::Base
  belongs_to :dot

  has_many :paragraphs, :dependent => :destroy
end
