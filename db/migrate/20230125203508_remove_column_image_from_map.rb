class RemoveColumnImageFromMap < ActiveRecord::Migration[7.0]
  def up
    remove_column :maps, :image
  end

  def down
    add_column :maps, :image, null: false
  end
end
