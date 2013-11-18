class CertificationApplication < ActiveRecord::Base
  attr_accessible :back_date, :certificater_name, :details, :out_date, :real_user_name, :reason, :use_mode, :user_id
  belongs_to :user
end
