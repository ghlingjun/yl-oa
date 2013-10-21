class RemoveStateFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :state
  end

  def down
    add_column :messages, :state, :string
  end
end
