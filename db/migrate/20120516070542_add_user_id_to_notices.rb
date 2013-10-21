class AddUserIdToNotices < ActiveRecord::Migration
  def self.up
    add_column :notices, :user_id, :integer

    add_index :notices, :user_id
  end

  def self.down
    remove_column :notices, :user_id
  end
end
