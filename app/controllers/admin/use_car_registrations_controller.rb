class Admin::UseCarRegistrationsController < Admin::BaseController
  def index
    @use_car_registrations = UseCarRegistration.paginate(:page => params[:page]).order('id DESC')
  end

  def show
  	@use_car_registration = UseCarRegistration.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end