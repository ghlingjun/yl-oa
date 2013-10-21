class ChangeEndAtInApplication < ActiveRecord::Migration
  def up
    change_column :applications, :end_at, :string
  end

  def down
    change_column :applications, :end_at, :datetime
  end
end
