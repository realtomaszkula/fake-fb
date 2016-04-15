class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :author_id, index: true
      t.timestamps null: false
    end
  end
end
