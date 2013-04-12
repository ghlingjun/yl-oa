class BusinessTripApplication < Application
  validates :reason, :presence => true
  validates :start_at, :presence => true
  validates :end_at, :presence => true
  validates :use, :presence => true

  USE = [
    I18n.t("init_data.business_trip_application.use.out_leave"),
    I18n.t("init_data.business_trip_application.use.travel_leave"),
    I18n.t("init_data.business_trip_application.use.bussiness_out")
  ]
end
