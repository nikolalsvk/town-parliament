class Regulation < ActiveRecord::Base
  belongs_to :head

  has_many :subjects, :dependent => :destroy
end
