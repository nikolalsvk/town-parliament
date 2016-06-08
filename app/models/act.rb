class Act < ActiveRecord::Base
  # Akt

  has_many :heads, :dependent => :destroy
end
