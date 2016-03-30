class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :author, index: true
      t.integer :parent, index: true

      t.timestamps null: false
    end
  end
end
