class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :author, index: true
      t.integer :parent, index: true

      t.timestamps null: false
    end
  end
end
