# == Schema Information
#
# Table name: amandments
#
#  id          :integer          not null, primary key
#  date        :date
#  type        :string           default("wait")
#  content     :text
#  explanation :text
#  rating      :integer
#  owner_id    :integer
#  owner_type  :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Amandment < ActiveRecord::Base
  TYPE = ["wait", "accepted", "declined"]

  belongs_to :owner, :polymorphic => true, :foreign_key => :owner_id

  belongs_to :user, -> { where(:name => "alderman") }
end
