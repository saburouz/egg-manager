class CreateLots < ActiveRecord::Migration[5.2]
  def change
    create_table :lots do |t|
      t.string :lot_name
      t.date :start_date
      t.integer :bird_house

      t.timestamps
    end
  end
end
