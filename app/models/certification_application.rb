class CertificationApplication < ActiveRecord::Base
  attr_accessible :back_date, :certificater_name, :details, :out_date, :real_user_name, :reason, :use_mode, :user_id
  belongs_to :user

  validates :reason, :presence => true

  USE = [
    I18n.t("init_data.certification_application.use.official_business"),
    I18n.t("init_data.certification_application.use.persinal_business"),
    I18n.t("init_data.application.use.other")
  ]

  USE_MODE = [
  	I18n.t("init_data.certification_application.use_mode.stamp"),
    I18n.t("init_data.certification_application.use_mode.copy"),
    I18n.t("init_data.certification_application.use_mode.borrow")
  ]
end
