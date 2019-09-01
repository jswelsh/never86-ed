class CreateBottles < ActiveRecord::Migration[6.0]
  def change
    create_table :bottles do |t|
      t.references :bar, foreign_key: true, null: false
      t.references :liquor, foreign_key: true, null: false
      t.index %i[bar_id liquor_id], unique: true
      t.timestamps
    end
  end
end
