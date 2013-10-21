class AddExpenseTypeToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :expense_type, :string
  end
end
