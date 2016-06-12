class Amandment < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true, :foreign_key => :owner_id

  belongs_to :user, -> { where(:name => "alderman") }
end
