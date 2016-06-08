class Head < ActiveRecord::Base
  # Glava
  belongs_to :act

  has_many :regulations, :dependent => :destroy
end
