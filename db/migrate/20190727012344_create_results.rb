class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.date :date
      t.integer :egg_count
      t.integer :egg_weight
      t.integer :bird_dead
      t.float :rate
      t.references :lot, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
