#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class SessionsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :check_authorization
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to notices_url, :notice => I18n.t("login.login_success")
    else
      redirect_to login_url, :notice => I18n.t("login.login_error")
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to notices_url, :notice => I18n.t("login.logout_prompt")
  end

end
