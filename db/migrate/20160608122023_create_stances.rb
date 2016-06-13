class CreateStances < ActiveRecord::Migration
  def change
    create_table :stances do |t|
      t.text :content
      t.string :name

      t.belongs_to :clause, :index => true

      t.timestamps null: false
    end
  end
end
