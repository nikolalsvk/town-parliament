class CreateAmandments < ActiveRecord::Migration
  def change
    create_table :amandments do |t|
      t.date :date
      t.string :category, :default => "wait"
      t.text :content
      t.text :explanation
      t.integer :rating

      t.references :owner, :polymorphic => true, :index => true
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
