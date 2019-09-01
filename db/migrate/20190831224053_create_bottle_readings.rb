class CreateBottleReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :bottle_readings do |t|
      t.time :reading_time, null: false
      t.numeric :fill, null: false, scale: 2, precision: 5
      t.references :bottle, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.index %i[bottle_id reading_time], unique: true, order: { reading_time: :desc }
      t.timestamps
    end
  end
end
