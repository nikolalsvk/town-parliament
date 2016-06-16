class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.boolean :status

      t.timestamps null: false
    end
  end
end
