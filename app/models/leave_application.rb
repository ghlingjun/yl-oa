class LeaveApplication < Application
  validates :reason, :presence => true
  validates :start_at, :presence => true
  validates :end_at, :presence => true
  validates :use, :presence => true

  USE = [
    I18n.t("init_data.leave_application.use.casual_leave"),
    I18n.t("init_data.leave_application.use.office_leave"),
    I18n.t("init_data.leave_application.use.sick_leave"),
#    I18n.t("init_data.leave_application.use.out_leave"),
#    I18n.t("init_data.leave_application.use.travel_leave"),

    I18n.t("init_data.application.use.other")
  ]
end