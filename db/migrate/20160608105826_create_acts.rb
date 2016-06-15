class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.text :preambula
      t.string :name
      t.string :state
      t.string :city
      t.date :date

      t.belongs_to :user, :index => true

      t.timestamps null: false
    end
  end
end
