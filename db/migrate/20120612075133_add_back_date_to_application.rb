class AddBackDateToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :back_date, :datetime
  end
end
