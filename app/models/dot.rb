class Dot < ActiveRecord::Base
  belongs_to :stance

  has_many :subdots, :dependent => :destroy
end
