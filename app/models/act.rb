class Act < ActiveRecord::Base
  # Akt
  belongs_to :user, -> { where(:name => "alderman") }

  has_many :heads, :dependent => :destroy
end
