class CreateMessageReceiver < ActiveRecord::Migration
  def self.up
    create_table :message_receivers do |t|
      t.integer :message_id
      t.integer :user_id

      t.timestamps
    end

    add_index :message_receivers, :message_id
    add_index :message_receivers, :user_id
  end

  def self.down
    drop_table :message_receivers
    end
end