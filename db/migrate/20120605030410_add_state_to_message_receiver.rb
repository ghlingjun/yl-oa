class AddStateToMessageReceiver < ActiveRecord::Migration
  def change
    add_column :message_receivers, :state, :string
  end
end
