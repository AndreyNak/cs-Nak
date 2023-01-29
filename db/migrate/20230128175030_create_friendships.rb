class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :friendships, :friend, references: :profiles, foreign_key: { to_table: :profiles }
  end
end
