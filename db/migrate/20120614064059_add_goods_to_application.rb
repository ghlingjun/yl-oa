class AddGoodsToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :goods, :string
  end
end
