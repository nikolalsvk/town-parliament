# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  def self.admin
    find_or_create_by(:name => "admin")
  end

  def self.citizen
    find_or_create_by(:name => "citizen")
  end

  def self.alderman
    find_or_create_by(:name => "alderman")
  end

  def self.assembly_president
    find_or_create_by(:name => "assembly_president")
  end
end
