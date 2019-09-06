class AllowNullBottleReadingInfo < ActiveRecord::Migration[6.0]
  def change
    change_column_null :bottle_readings, :fill, true
    change_column_null :bottle_readings, :reading_time, true
    add_column :bottle_readings, :status, :integer, null: false, default: 0
    add_index :bottle_readings, :status
  end
end
