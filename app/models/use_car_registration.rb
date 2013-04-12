class UseCarRegistration < ActiveRecord::Base
  attr_accessible :end_at_date, :end_km_num, :real_user_name, :reason, :start_at_date, :start_km_num
  belongs_to :user
end
