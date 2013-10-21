class ChangeStartAtInApplication < ActiveRecord::Migration
  def up
    change_column :applications, :start_at, :string
  end

  def down
    change_column :applications, :start_at, :datetime
  end
end
