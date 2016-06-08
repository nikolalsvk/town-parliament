class Amandment < ActiveRecord::Base
  belongs_to :clause
  belongs_to :user, -> { where(:name => "alderman") }
end
