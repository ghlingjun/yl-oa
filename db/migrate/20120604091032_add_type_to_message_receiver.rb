class AddTypeToMessageReceiver < ActiveRecord::Migration
  def change
    add_column :message_receivers, :type, :string
  end
end
