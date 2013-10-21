class RemoveTypeFromMessageReceiver < ActiveRecord::Migration
  def up
    remove_column :message_receivers, :type
  end

  def down
    add_column :message_receivers, :type, :string
  end
end
