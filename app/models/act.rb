class Act < ActiveRecord::Base
  has_many :heads, :dependent => :destroy
end
