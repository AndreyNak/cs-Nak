class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_reference :users, :user_role, foreign_key: true
  end
end
