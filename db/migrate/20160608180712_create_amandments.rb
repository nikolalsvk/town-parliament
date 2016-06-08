class CreateAmandments < ActiveRecord::Migration
  def change
    create_table :amandments do |t|
      t.date :date
      t.string :type
      t.text :content
      t.text :explanation

      t.belongs_to :clause
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
