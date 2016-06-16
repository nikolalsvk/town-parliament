class CreateHeads < ActiveRecord::Migration
  def change
    create_table :heads do |t|
      t.string :name
      t.string :category

      t.belongs_to :act, :index => true

      t.timestamps null: false
    end
  end
end
