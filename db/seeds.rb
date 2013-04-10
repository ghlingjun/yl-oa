# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

if true
  #encoding: utf-8
  User.delete_all
  Notice.delete_all
  liu = User.create!(:name=>"liuqingbo", :real_name=>I18n.t("init_data.user.name1"), :email=>"qingbo_matthew@163.com",
          :password=>"123456", :password_confirmation=>"123456", :position=>User::Positions[:manager])
  zhang = User.create!(:name=>"zhanglingjun", :real_name=>I18n.t("init_data.user.name2"), :email=>"qingbo_matthew@163.com",
          :password=>"123456", :password_confirmation=>"123456", :position=>User::Positions[:manager])
  wu = User.create!(:name=>"wuweiping", :real_name=>I18n.t("init_data.user.name3"), :email=>"qingbo_matthew@163.com",
          :password=>"123456", :password_confirmation=>"123456", :position=>User::Positions[:vice_president])
  xia = User.create!(:name=>"xiacongjun", :real_name=>I18n.t("init_data.user.name4"), :email=>"qingbo_matthew@163.com",
          :password=>"123456", :password_confirmation=>"123456", :position=>User::Positions[:president])
  liu_2 = User.create!(:name=>"liupei", :real_name=>I18n.t("init_data.user.name5"), :email=>"qingbo_matthew@163.com",
          :password=>"123456", :password_confirmation=>"123456", :position=>User::Positions[:vice_president])
  renshi = User.create!(:name=>"admin", :real_name=>I18n.t("init_data.user.name6"), :email=>"qingbo_matthew@163.com",
          :password=>"123456", :password_confirmation=>"123456", :position=>User::Positions[:staff])
  caiwu = User.create!(:name=>"finance", :real_name=>I18n.t("init_data.user.name7"), :email=>"qingbo_matthew@163.com",
          :password=>"123456", :password_confirmation=>"123456", :position=>User::Positions[:staff])
  op = User.create!(:name=>"operator", :real_name=>I18n.t("init_data.user.name8"), :email=>"qingbo_matthew@163.com",
          :password=>"123456", :password_confirmation=>"123456", :position=>User::Positions[:staff])


  liu.parent = wu
  zhang.parent = wu
  wu.parent = xia
  liu_2.parent = xia
  liu.save!
  zhang.save!
  wu.save!
  liu_2.save!

  Role.delete_all
  operator = Role.create!(:name=>Role::ROLES[:operator])
  admin = Role.create!(:name=>Role::ROLES[:admin])
  finance = Role.create!(:name=>Role::ROLES[:finance])
  sale = Role.create!(:name=>Role::ROLES[:sale])
  developer = Role.create!(:name=>Role::ROLES[:developer])

  liu.roles << developer
  zhang.roles << developer
  wu.roles << developer
  liu_2.roles << developer
  op.roles << operator
  xia.roles << developer
  renshi.roles << admin
  caiwu.roles << finance

  Right.delete_all
  notices_create = Right.create!(:resource => "notices", :operation => "CREATE")
  notices_read = Right.create!(:resource => "notices", :operation => "READ")
  notices_update = Right.create!(:resource => "notices", :operation => "UPDATE")
  notices_delete = Right.create!(:resource => "notices", :operation => "DELETE")

  Role.all.each do |role|
    role.rights << notices_read
  end
  admin.rights << notices_create
  admin.rights << notices_update
  admin.rights << notices_delete

  users_create = Right.create!(:resource => "users", :operation => "CREATE")
  users_read = Right.create!(:resource => "users", :operation => "READ")
  users_update = Right.create!(:resource => "users", :operation => "UPDATE")
  users_delete = Right.create!(:resource => "users", :operation => "DELETE")
  operator.rights << users_create
  operator.rights << users_read
  operator.rights << users_update
  operator.rights << users_delete



  roles_create = Right.create!(:resource => "roles", :operation => "CREATE")
  roles_read = Right.create!(:resource => "roles", :operation => "READ")
  roles_update = Right.create!(:resource => "roles", :operation => "UPDATE")
  roles_delete = Right.create!(:resource => "roles", :operation => "DELETE")
  operator.rights << roles_create
  operator.rights << roles_read
  operator.rights << roles_update
  operator.rights << roles_delete

  Message.delete_all
  communicate_messages = []
  communicate_messages << Right.create!(:resource => "communicate_messages", :operation => "CREATE")
  communicate_messages <<  Right.create!(:resource => "communicate_messages", :operation => "READ")
  communicate_messages <<  Right.create!(:resource => "communicate_messages", :operation => "UPDATE")
  communicate_messages << Right.create!(:resource => "communicate_messages", :operation => "DELETE")
  communicate_messages.each do|communicate_message|
    Role.all.each do|role|
      role.rights << communicate_message
    end
  end
  prompt_messages = []
  prompt_messages << Right.create!(:resource => "prompt_messages", :operation => "CREATE")
  prompt_messages <<  Right.create!(:resource => "prompt_messages", :operation => "READ")
  prompt_messages <<  Right.create!(:resource => "prompt_messages", :operation => "UPDATE")
  prompt_messages << Right.create!(:resource => "prompt_messages", :operation => "DELETE")
  prompt_messages.each do|prompt_messages|
    Role.all.each do|role|
      role.rights << prompt_messages
    end
  end

  Application.delete_all
  leave_applications = []
  leave_applications << Right.create!(:resource => "leave_applications", :operation => "CREATE")
  leave_applications << Right.create!(:resource => "leave_applications", :operation => "READ")
  leave_applications << Right.create!(:resource => "leave_applications", :operation => "UPDATE")
  leave_applications << Right.create!(:resource => "leave_applications", :operation => "DELETE")
  leave_applications.each do|leave_application|
      Role.all.each do|role|
        role.rights << leave_application
      end
  end

  item_applications = []
  item_applications << Right.create!(:resource => "item_applications", :operation => "CREATE")
  item_applications << Right.create!(:resource => "item_applications", :operation => "READ")
  item_applications << Right.create!(:resource => "item_applications", :operation => "UPDATE")
  item_applications << Right.create!(:resource => "item_applications", :operation => "DELETE")
  item_applications.each do|item_application|
    Role.all.each do|role|
      role.rights << item_application
    end
  end

  expense_applications = []
  expense_applications << Right.create!(:resource => "expense_applications", :operation => "CREATE")
  expense_applications <<  Right.create!(:resource => "expense_applications", :operation => "READ")
  expense_applications <<  Right.create!(:resource => "expense_applications", :operation => "UPDATE")
  expense_applications << Right.create!(:resource => "expense_applications", :operation => "DELETE")
  expense_applications.each do|expense_application|
    Role.all.each do|role|
      role.rights << expense_application
    end
  end

  ApplicationReceiver.delete_all
  application_receivers = []
  application_receivers << Right.create!(:resource => "application_receivers", :operation => "CREATE")
  application_receivers << Right.create!(:resource => "application_receivers", :operation => "READ")
  application_receivers << Right.create!(:resource => "application_receivers", :operation => "UPDATE")
  application_receivers << Right.create!(:resource => "application_receivers", :operation => "DELETE")
  application_receivers.each do|application_receiver|
    Role.all.each do|role|
      role.rights << application_receiver
    end
  end

  WorkLog.delete_all
  work_logs = []
  work_logs << Right.create!(:resource => "work_logs", :operation => "CREATE")
  work_logs << Right.create!(:resource => "work_logs", :operation => "READ")
  work_logs << Right.create!(:resource => "work_logs", :operation => "UPDATE")
  work_logs << Right.create!(:resource => "work_logs", :operation => "DELETE")
  work_logs.each do|work_log|
    Role.all.each do|role|
      role.rights << work_log
    end
  end

end

payment_applications = []
payment_applications << Right.create!(:resource => "payment_applications", :operation => "CREATE")
payment_applications <<  Right.create!(:resource => "payment_applications", :operation => "READ")
payment_applications <<  Right.create!(:resource => "payment_applications", :operation => "UPDATE")
payment_applications << Right.create!(:resource => "payment_applications", :operation => "DELETE")
payment_applications.each do|payment_application|
  Role.all.each do|role|
    role.rights << payment_application
  end
end
contract_applications = []
contract_applications << Right.create!(:resource => "contract_applications", :operation => "CREATE")
contract_applications <<  Right.create!(:resource => "contract_applications", :operation => "READ")
contract_applications <<  Right.create!(:resource => "contract_applications", :operation => "UPDATE")
contract_applications << Right.create!(:resource => "contract_applications", :operation => "DELETE")
contract_applications.each do|contract_application|
  Role.all.each do|role|
    role.rights << contract_application
  end
end

billing_applications = []
billing_applications << Right.create!(:resource => "billing_applications", :operation => "CREATE")
billing_applications <<  Right.create!(:resource => "billing_applications", :operation => "READ")
billing_applications <<  Right.create!(:resource => "billing_applications", :operation => "UPDATE")
billing_applications << Right.create!(:resource => "billing_applications", :operation => "DELETE")
billing_applications.each do|billing_application|
  Role.all.each do|role|
    role.rights << billing_application
  end
end
