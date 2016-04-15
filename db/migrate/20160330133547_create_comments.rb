class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :author_id, index: true
      t.integer :parent_id, index: true

      t.timestamps null: false
    end
  end
end
