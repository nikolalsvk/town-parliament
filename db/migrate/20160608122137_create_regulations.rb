class CreateRegulations < ActiveRecord::Migration
  def change
    create_table :regulations do |t|
      t.string :name
      t.text :definition

      t.belongs_to :head, :index => true

      t.timestamps null: false
    end
  end
end
