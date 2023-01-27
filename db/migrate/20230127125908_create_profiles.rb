class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :nickname, null: false
      t.integer :place, null: false
      t.string :country
      t.integer :elo, null: false, default: 500
      t.float :kd, null: false, default: 0
      t.integer :kills, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
