class ContractApplication < Application
  validates :reason, :presence => true
  validates :contract_name, :presence => true
  validates :sum, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :use, :presence => true

  USE = [
    I18n.t("init_data.contract_application.use.sale"),
    I18n.t("init_data.contract_application.use.purchase"),
    I18n.t("init_data.application.use.other")
  ]
  scope :pending_finance_opinion, lambda{where("finance_opinion is null and state= 'approved'")}

end