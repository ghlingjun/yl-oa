class AddLogDateToWorkLogs < ActiveRecord::Migration
  def change
    add_column :work_logs, :log_date, :datetime
  end
end
