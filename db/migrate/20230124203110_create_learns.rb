class CreateLearns < ActiveRecord::Migration[7.0]
  def change
    create_table :learns do |t|
      t.string :title, null: false
      t.text :content
      t.timestamps
    end
  end
end
