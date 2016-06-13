class CreateClauses < ActiveRecord::Migration
  def change
    create_table :clauses do |t|
      t.string :name

      t.belongs_to :subject, :index => true

      t.timestamps null: false
    end
  end
end
