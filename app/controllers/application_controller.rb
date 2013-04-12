WillPaginate.per_page = 10

class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :current_user
  before_filter :check_authorization

  helper_method :current_user
  protect_from_forgery

  def download
    render :nothing => true if params[:id]
    model_obj = Application.find(params[:id])
    path =  model_obj.attachment_file.path.partition("public")
    send_file(path[1] + path[2])
  end

  
  protected
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => I18n.t("login.login_prompt")
      end
    end

    def check_authorization
      unless current_user && current_user.can?(action_name, controller_name)
        redirect_to root_path,
                      :notice=>I18n.t("error.permit_deny")
      end
    end

    def get_user_ids_by_real_names(names)
      user_ids = User.find_ids_by_real_names(names.split(";"))
    end
  
end
