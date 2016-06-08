class Head < ActiveRecord::Base
  belongs_to :act

  has_many :regulations, :dependent => :destroy
end
