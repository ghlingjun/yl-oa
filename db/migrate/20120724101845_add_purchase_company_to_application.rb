class AddPurchaseCompanyToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :purchase_company, :string
  end
end
