class Regulation < ActiveRecord::Base
  # Odredba
  belongs_to :head

  has_many :subjects, :dependent => :destroy
end
