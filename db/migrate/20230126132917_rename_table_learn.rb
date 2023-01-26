class RenameTableLearn < ActiveRecord::Migration[7.0]
  def up
    rename_table :learns, :lessons
  end

  def down
    rename_table :lessons, :learns
  end
end
