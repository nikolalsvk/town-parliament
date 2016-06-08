class CreateAmandman < ActiveRecord::Migration
  def change
    create_table :amandman do |t|
      t.date :date
      t.string :type
      t.text :content

      t.belongs_to :clause, :index => true
      t.belongs_to :user, :index => true

      t.timestamps null: false
    end
  end
end
