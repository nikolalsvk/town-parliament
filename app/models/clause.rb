class Clause < ActiveRecord::Base
  belongs_to :subject

  has_many :stances, :dependent => :destroy
end
