class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :about
      t.date :start_date
      t.date :end_date
      t.integer :owner_id
      
      t.timestamps
    end
  end
end
