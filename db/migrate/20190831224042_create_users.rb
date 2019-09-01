class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :organization, foreign_key: true, null: false
      t.string :email, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
