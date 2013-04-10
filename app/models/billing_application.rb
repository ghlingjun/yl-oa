class BillingApplication < Application
  validates :reason, :presence => true
  validates :purchase_company, :presence => true
  validates :sum, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :use, :presence => true

  USE = [
    I18n.t("init_data.billing_application.use.invoice_17percent"),
    I18n.t("init_data.billing_application.use.invoice_6percent"),
    I18n.t("init_data.application.use.other")
  ]
end