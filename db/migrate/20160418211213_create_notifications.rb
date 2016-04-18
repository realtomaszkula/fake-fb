class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :giver_id, index: true
      t.integer :receiver_id, index: true
      t.boolean :viewed, default: false
      t.integer :notifiable_id
      t.string :notifiable_type

      t.timestamps null: false
    end

    add_index :notifications, [:notifiable_type, :notifiable_id]

  end
end
