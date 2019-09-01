class CreateBars < ActiveRecord::Migration[6.0]
  def change
    create_table :bars do |t|
      t.string :name, null: false
      t.references :organization, foreign_key: true, null: false
      t.index %i[name organization_id], unique: true
      t.timestamps
    end
  end
end
