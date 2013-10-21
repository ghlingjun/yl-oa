class FixColumnStartAndEndName < ActiveRecord::Migration
  def change
  	change_table :applications do |t|
  		t.rename :start_date, :start_at
  		t.rename :end_date, :end_at
  	end
  end
end
