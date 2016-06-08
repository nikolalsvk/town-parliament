class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.text :content
      t.string :name

      t.timestamps null: false
    end
  end
end
