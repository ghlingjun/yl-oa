class BillingApplicationsController < ApplicationController

  def index
    @size = current_user.send_applications.billing_applications.size
    @billing_applications = current_user.send_applications.billing_applications
      .paginate(:page => params[:page]).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @billing_applications }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @billing_application = BillingApplication.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @billing_application }
    end
  end


  def create
    @billing_application = BillingApplication.new(params[:billing_application])
    @billing_application.sender = current_user

    respond_to do |format|
      if @billing_application.save
        format.html { redirect_to(@billing_application, :notice => 'billing_applications was successfully created.') }
        format.xml  { render :xml => @billing_application, :status => :created, :location => @billing_application }
      else
        format.html { render "new" }
        format.xml  { render :xml => @billing_application.errors, :status => :unprocessable_entity }
      end
    end

  end

  def show
    @billing_application = BillingApplication.find(params[:id])
    # BillingApplication.find_by_message_and_receiver(@communicate_message, current_user).first.read_message!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @billing_application }
    end
  end
end