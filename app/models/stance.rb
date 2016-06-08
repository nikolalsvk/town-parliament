class Stance < ActiveRecord::Base
  # Stav
  belongs_to :clause

  has_many :dots, :dependent => :destroy
end
