class RemoveTitleFromApplications < ActiveRecord::Migration
  def up
    remove_column :applications, :title
      end

  def down
    add_column :applications, :title, :string
  end
end
