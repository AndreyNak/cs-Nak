class AddSlagToModes < ActiveRecord::Migration[7.0]
  def change
    add_column :modes, :slug, :string
    add_index :modes, :slug, unique: true
  end
end
