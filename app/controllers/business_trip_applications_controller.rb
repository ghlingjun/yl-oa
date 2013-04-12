class BusinessTripApplicationsController < ApplicationController

  def index
    @size = current_user.send_applications.business_trip_applications.size
    @business_trip_applications = current_user.send_applications.business_trip_applications
      .paginate(:page => params[:page]).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @business_trip_applications }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @business_trip_application = BusinessTripApplication.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @business_trip_application }
    end
  end

  def create
    @business_trip_application = BusinessTripApplication.new(params[:business_trip_application])
    @business_trip_application.sender = current_user
    respond_to do |format|
      if @business_trip_application.save
        format.html { redirect_to(@business_trip_application, :notice => 'business_trip_application was successfully created.') }
        format.xml  { render :xml => @business_trip_application, :status => :created, :location => @business_trip_application }
      else
        format.html { render "new" }
        format.xml  { render :xml => @business_trip_application.errors, :status => :unprocessable_entity }
      end
    end

  end

  def show
    @business_trip_application = BusinessTripApplication.find(params[:id])
    # LeaveApplication.find_by_message_and_receiver(@communicate_message, current_user).first.read_message!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @business_trip_application }
    end
  end

  def edit
    @business_trip_application = BusinessTripApplication.find(params[:id])
  end

  def update
    @business_trip_application = BusinessTripApplication.find(params[:id])

    respond_to do |format|
      if @business_trip_application.update_attributes(params[:business_trip_application])
        format.html { redirect_to(business_trip_applications_path, :notice => 'business_trip_application was successfully update.') }
      else
        format.html { render "edit" }
      end
    end
  end

  def destroy
    @business_trip_application = BusinessTripApplication.find(params[:id])
    @business_trip_application.destroy

    respond_to do |format|
      format.html { redirect_to(business_trip_applications_path, :notice=>"business_trip_application was successfully deleted.") }
      format.xml  { head :ok }
    end
  end

end
