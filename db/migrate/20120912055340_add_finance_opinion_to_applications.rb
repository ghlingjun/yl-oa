class AddFinanceOpinionToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :finance_opinion, :string, :default => "pending"
  end
end
