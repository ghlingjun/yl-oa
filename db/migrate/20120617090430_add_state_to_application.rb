class AddStateToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :state, :string
  end
end
