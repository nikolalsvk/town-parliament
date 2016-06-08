class Clause < ActiveRecord::Base
  # Clan
  belongs_to :subject

  has_many :stances, :dependent => :destroy
end
