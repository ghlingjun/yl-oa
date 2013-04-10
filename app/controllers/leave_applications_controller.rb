class LeaveApplicationsController < ApplicationController

  # before_filter :get_type_value

  def index
    @size = current_user.send_applications.leave_applications.size
    @leave_applications = current_user.send_applications.leave_applications
      .paginate(:page => params[:page]).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leave_applications }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @leave_application = LeaveApplication.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @leave_application }
    end
  end

  def create
    @leave_application = LeaveApplication.new(params[:leave_application])
    @leave_application.sender = current_user
    respond_to do |format|
      if @leave_application.save
        format.html { redirect_to(@leave_application, :notice => 'leave_application was successfully created.') }
        format.xml  { render :xml => @leave_application, :status => :created, :location => @leave_application }
      else
        format.html { render "new" }
        format.xml  { render :xml => @leave_application.errors, :status => :unprocessable_entity }
      end
    end

  end

  def show
    @leave_application = LeaveApplication.find(params[:id])
    # LeaveApplication.find_by_message_and_receiver(@communicate_message, current_user).first.read_message!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @leave_application }
    end
  end

  def edit
    @leave_application = LeaveApplication.find(params[:id])
  end

  def update
    @leave_application = LeaveApplication.find(params[:id])

    respond_to do |format|
      if @leave_application.update_attributes(params[:leave_application])
        format.html { redirect_to(leave_applications_path, :notice => 'leave_application was successfully update.') }
      else
        format.html { render "edit" }
      end
    end
  end


end
