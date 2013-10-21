class AddContractNameToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :contract_name, :string
  end
end
