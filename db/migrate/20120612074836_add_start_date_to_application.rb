class AddStartDateToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :start_date, :datetime
  end
end
