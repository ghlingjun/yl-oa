class RemoveStateFromApplication < ActiveRecord::Migration
  def up
    remove_column :applications, :state
      end

  def down
    add_column :applications, :state, :string
  end
end
