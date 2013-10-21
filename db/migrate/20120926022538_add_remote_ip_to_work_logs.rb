class AddRemoteIpToWorkLogs < ActiveRecord::Migration
  def change
    add_column :work_logs, :remote_ip, :string
  end
end
