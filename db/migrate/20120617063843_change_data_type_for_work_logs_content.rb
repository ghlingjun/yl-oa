class ChangeDataTypeForWorkLogsContent < ActiveRecord::Migration
  def change
    change_column :work_logs, :content, :text
  end
end
