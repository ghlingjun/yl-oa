class AddUseToToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :use_to, :string
  end
end
