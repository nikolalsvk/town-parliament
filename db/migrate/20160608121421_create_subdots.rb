class CreateSubdots < ActiveRecord::Migration
  def change
    create_table :subdots do |t|
      t.text :content
      t.string :name

      t.belongs_to :dot, :index => true

      t.timestamps null: false
    end
  end
end
