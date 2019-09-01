class CreateLiquors < ActiveRecord::Migration[6.0]
  def change
    create_table :liquors do |t|
      t.string :spirit, null: false
      t.string :brand, null: false
      t.string :name
      t.integer :capacity, null: false
      t.numeric :cost, null: false, scale: 2, precision: 5
      t.index %i[spirit brand name capacity], unique: true
      t.index %i[brand name capacity], unique: true
      t.timestamps
    end
  end
end
