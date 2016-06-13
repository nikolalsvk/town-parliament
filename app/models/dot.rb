class Dot < ActiveRecord::Base
  # Tacka
  belongs_to :stance

  has_many :subdots, :dependent => :destroy
end
