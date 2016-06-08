class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.text :content
      t.string :name

      t.belongs_to :subdot, :index => true

      t.timestamps null: false
    end
  end
end
