class Subject < ActiveRecord::Base
  belongs_to :regulation

  has_many :clauses, :dependent => :destroy
end
