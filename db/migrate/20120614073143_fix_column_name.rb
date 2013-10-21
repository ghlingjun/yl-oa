class FixColumnName < ActiveRecord::Migration
  def change
  	change_table :applications do |t|
  		t.rename :goods, :item_name
  		t.rename :use_to, :use
  	end
  end
end
