class AddStatusToActs < ActiveRecord::Migration
  def change
    add_column :acts, :status, :string
  end
end
