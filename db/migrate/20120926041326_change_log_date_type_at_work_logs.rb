class ChangeLogDateTypeAtWorkLogs < ActiveRecord::Migration
  def change
    change_column :work_logs, :log_date, :date
  end
end
