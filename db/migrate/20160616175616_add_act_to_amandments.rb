class AddActToAmandments < ActiveRecord::Migration
  def change
    add_reference :amandments, :act, index: true, foreign_key: true
  end
end
