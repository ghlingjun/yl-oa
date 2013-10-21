class AddProjectNameToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :project_name, :string
  end
end
