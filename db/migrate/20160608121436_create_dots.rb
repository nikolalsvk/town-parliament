class CreateDots < ActiveRecord::Migration
  def change
    create_table :dots do |t|
      t.text :content
      t.string :name

      t.belongs_to :stance, :index => true

      t.timestamps null: false
    end
  end
end
