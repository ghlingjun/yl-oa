class UseCarRegistrationsController < ApplicationController

  def index
    @use_car_registrations = current_user.use_car_registrations.paginate(:page => params[:page]).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @use_car_registration = UseCarRegistration.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def create
    @use_car_registration = UseCarRegistration.new(params[:use_car_registration])
    @use_car_registration.user = current_user

    respond_to do |format|
      if @use_car_registration.save
        format.html { redirect_to(@use_car_registration, :notice => 'use_car_registration was successfully created.') }
      else
        format.html { render "new" }
      end
    end

  end

  def show
    @use_car_registration = UseCarRegistration.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
    @use_car_registration = UseCarRegistration.find(params[:id])
  end

  def update
    @use_car_registration = UseCarRegistration.find(params[:id])
    respond_to do |format|
      if @use_car_registration.update_attributes(params[:use_car_registration])
        format.html { redirect_to(@use_car_registration, :notice => 'use_car_registration was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end
