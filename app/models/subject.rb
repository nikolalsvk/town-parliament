class Subject < ActiveRecord::Base
  # Predmet
  belongs_to :regulation

  has_many :clauses, :dependent => :destroy
end
