class AddEndDateToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :end_date, :datetime
  end
end
