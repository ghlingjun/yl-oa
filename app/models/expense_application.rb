class ExpenseApplication < Application
  validates :reason, :presence => true
  validates :item_name, :presence => true
  validates :sum, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :use, :presence => true
  
  USE = [
    I18n.t("init_data.expense_application.use.project"),
    I18n.t("init_data.expense_application.use.office"),
    I18n.t("init_data.expense_application.use.business_affair"),
    I18n.t("init_data.expense_application.use.travel"),
    I18n.t("init_data.application.use.other")
  ]
end