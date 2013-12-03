class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qq, :string
    add_column :users, :weixin, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :work_phone, :string
  end
end
