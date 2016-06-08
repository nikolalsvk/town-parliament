class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :preambula
      t.string :name
      t.string :state
      t.string :city
      t.date :date

      t.timestamps null: false
    end
  end
end
