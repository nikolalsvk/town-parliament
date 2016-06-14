class Amandment < ActiveRecord::Base
  TYPE = ["wait", "accepted", "declined"]

  belongs_to :owner, :polymorphic => true, :foreign_key => :owner_id

  belongs_to :user, -> { where(:name => "alderman") }
end
