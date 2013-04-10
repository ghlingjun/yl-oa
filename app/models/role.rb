class Role < ActiveRecord::Base
  attr_accessible :name

  ROLES = {
    :operator => I18n.t("init_data.role.operator"),
    :admin    => I18n.t("init_data.role.admin"),
    :finance   => I18n.t("init_data.role.finance"),
    :sale     => I18n.t("init_data.role.sale"),
    :developer=> I18n.t("init_data.role.developer")
  }
  has_and_belongs_to_many :users
  has_many :grants
  has_many :rights, :through=>:grants 
  scope :for, lambda{|action, resource|
                  where("rights.operation=? AND rights.resource = ?",
                    Right::OPERATION_MAPPINGS[action], resource
                  )}
end
