class Stance < ActiveRecord::Base
  belongs_to :clause

  has_many :dots, :dependent => :destroy
end
