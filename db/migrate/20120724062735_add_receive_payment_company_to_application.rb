class AddReceivePaymentCompanyToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :receive_payment_company, :string
  end
end
