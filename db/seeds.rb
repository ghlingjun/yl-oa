# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

if true
  # encoding: utf-8
  # Role.delete_all
  operator = Role.find_or_initialize_by_id(1)
  operator.name = Role::ROLES[:operator]
  operator.save!
  admin = Role.find_or_initialize_by_id(2)
  admin.name = Role::ROLES[:admin]
  admin.save!
  finance = Role.find_or_initialize_by_id(3)
  finance.name = Role::ROLES[:finance]
  finance.save!
  sale = Role.find_or_initialize_by_id(4)
  sale.name = Role::ROLES[:sale]
  sale.save!
  developer = Role.find_or_initialize_by_id(5)
  developer.name = Role::ROLES[:developer]
  developer.save!
  human_resource = Role.find_or_initialize_by_id(6)
  human_resource.name = Role::ROLES[:human_resource]
  human_resource.save!
  
  User.delete_all
  root = User.create!(:name=>"root", :real_name=>I18n.t("init_data.user.name"), 
    :email=>"root@gmail.com", :password=>"admin1314", 
    :password_confirmation=>"admin1314", :position=>User::Positions[:staff])
  root.roles << operator
 
  Right.delete_all
  users_create = Right.create!(:resource => "users", :operation => "CREATE")
  users_read = Right.create!(:resource => "users", :operation => "READ")
  users_update = Right.create!(:resource => "users", :operation => "UPDATE")
  users_delete = Right.create!(:resource => "users", :operation => "DELETE")
  Role.all.each do |role|
    role.rights << users_read
  end
  operator.rights << users_create
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

  # Notice.delete_all
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

  # Message.delete_all
  communicate_messages = []
  communicate_messages << Right.create!(:resource => "communicate_messages", :operation => "CREATE")
  communicate_messages << Right.create!(:resource => "communicate_messages", :operation => "READ")
  communicate_messages << Right.create!(:resource => "communicate_messages", :operation => "UPDATE")
  communicate_messages << Right.create!(:resource => "communicate_messages", :operation => "DELETE")
  communicate_messages.each do|communicate_message|
    Role.all.each do|role|
      role.rights << communicate_message
    end
  end
  prompt_messages = []
  prompt_messages << Right.create!(:resource => "prompt_messages", :operation => "CREATE")
  prompt_messages << Right.create!(:resource => "prompt_messages", :operation => "READ")
  prompt_messages << Right.create!(:resource => "prompt_messages", :operation => "UPDATE")
  prompt_messages << Right.create!(:resource => "prompt_messages", :operation => "DELETE")
  prompt_messages.each do|prompt_messages|
    Role.all.each do|role|
      role.rights << prompt_messages
    end
  end

  # Application.delete_all
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
  expense_applications << Right.create!(:resource => "expense_applications", :operation => "READ")
  expense_applications << Right.create!(:resource => "expense_applications", :operation => "UPDATE")
  expense_applications << Right.create!(:resource => "expense_applications", :operation => "DELETE")
  expense_applications.each do|expense_application|
    Role.all.each do|role|
      role.rights << expense_application
    end
  end

  # ApplicationReceiver.delete_all
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

  # WorkLog.delete_all
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

  payment_applications = []
  payment_applications << Right.create!(:resource => "payment_applications", :operation => "CREATE")
  payment_applications << Right.create!(:resource => "payment_applications", :operation => "READ")
  payment_applications << Right.create!(:resource => "payment_applications", :operation => "UPDATE")
  payment_applications << Right.create!(:resource => "payment_applications", :operation => "DELETE")
  payment_applications.each do|payment_application|
  	Role.all.each do|role|
      role.rights << payment_application
    end
  end

  contract_applications = []
  contract_applications << Right.create!(:resource => "contract_applications", :operation => "CREATE")
  contract_applications << Right.create!(:resource => "contract_applications", :operation => "READ")
  contract_applications << Right.create!(:resource => "contract_applications", :operation => "UPDATE")
  contract_applications << Right.create!(:resource => "contract_applications", :operation => "DELETE")
  contract_applications.each do|contract_application|
    Role.all.each do|role|
      role.rights << contract_application
    end
  end

  billing_applications = []
  billing_applications << Right.create!(:resource => "billing_applications", :operation => "CREATE")
  billing_applications << Right.create!(:resource => "billing_applications", :operation => "READ")
  billing_applications << Right.create!(:resource => "billing_applications", :operation => "UPDATE")
  billing_applications << Right.create!(:resource => "billing_applications", :operation => "DELETE")
  billing_applications.each do|billing_application|
    Role.all.each do|role|
      role.rights << billing_application
    end
  end

  r = Right.create!(:resource => "application", :operation => "download")
  Role.all.each do|role|
    role.rights << r
  end

  business_trip_applications = []
  business_trip_applications << Right.create!(:resource => "business_trip_applications", :operation => "CREATE")
  business_trip_applications << Right.create!(:resource => "business_trip_applications", :operation => "READ")
  business_trip_applications << Right.create!(:resource => "business_trip_applications", :operation => "UPDATE")
  business_trip_applications << Right.create!(:resource => "business_trip_applications", :operation => "DELETE")
  business_trip_applications.each do|business_trip_application|
    Role.all.each do|role|
      role.rights << business_trip_application
    end
  end

  r = Right.create!(:resource => "work_logs", :operation => "statistics")
  Role.all.each do|role|
    role.rights << r
  end

  use_car_registrations = []
  use_car_registrations << Right.create!(:resource => "use_car_registrations", :operation => "CREATE")
  use_car_registrations << Right.create!(:resource => "use_car_registrations", :operation => "READ")
  use_car_registrations << Right.create!(:resource => "use_car_registrations", :operation => "UPDATE")
  use_car_registrations << Right.create!(:resource => "use_car_registrations", :operation => "DELETE")
  use_car_registrations.each do|use_car_registration|
    Role.all.each do|role|
      role.rights << use_car_registration
    end
  end

  certification_applications = []
  certification_applications << Right.create!(:resource => "certification_applications", :operation => "CREATE")
  certification_applications << Right.create!(:resource => "certification_applications", :operation => "READ")
  certification_applications << Right.create!(:resource => "certification_applications", :operation => "UPDATE")
  certification_applications << Right.create!(:resource => "certification_applications", :operation => "DELETE")
  certification_applications.each do|certification_application|
    Role.all.each do|role|
      role.rights << certification_application
    end
  end

end
