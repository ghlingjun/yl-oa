class Admin::BaseController < ApplicationController
  before_filter :check_role_or_not
  protected
    def check_role_or_not
      unless current_user && current_user.roles_name.include?(Role::ROLES[:admin])
        redirect_to root_path,
                      :notice=>I18n.t("error.permit_deny")
      end
    end
end