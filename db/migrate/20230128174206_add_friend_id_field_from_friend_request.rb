class AddFriendIdFieldFromFriendRequest < ActiveRecord::Migration[7.0]
  def change
    add_reference :friend_requests, :friend, references: :profiles, foreign_key: { to_table: :profiles }
  end
end
