class CreateWorkLogs < ActiveRecord::Migration
  def change
    create_table :work_logs do |t|
      t.string :content
      t.integer :user_id
      t.timestamps
    end

    add_index :work_logs, :user_id
  end
end
