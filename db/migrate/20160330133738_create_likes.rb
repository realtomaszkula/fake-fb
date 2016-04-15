class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :author_id, index: true
      t.integer :parent_id, index: true

      t.timestamps null: false
    end
  end
end
