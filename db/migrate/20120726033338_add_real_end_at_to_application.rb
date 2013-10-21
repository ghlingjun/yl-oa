class AddRealEndAtToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :real_end_at, :string
  end
end
