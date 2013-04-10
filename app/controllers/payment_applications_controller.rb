class PaymentApplicationsController < ApplicationController

  def index
    @size = current_user.send_applications.payment_applications.size
    @payment_applications = current_user.send_applications.payment_applications
      .paginate(:page => params[:page]).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_applications }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @payment_application = PaymentApplication.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_application }
    end
  end


  def create
    @payment_application = PaymentApplication.new(params[:payment_application])
    @payment_application.sender = current_user

    respond_to do |format|
      if @payment_application.save
        format.html { redirect_to(@payment_application, :notice => 'payment_application was successfully created.') }
        format.xml  { render :xml => @payment_application, :status => :created, :location => @payment_application }
      else
        format.html { render "new" }
        format.xml  { render :xml => @payment_application.errors, :status => :unprocessable_entity }
      end
    end

  end

  def show
    @payment_application = PaymentApplication.find(params[:id])
    # PaymentApplication.find_by_message_and_receiver(@communicate_message, current_user).first.read_message!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_application }
    end
  end

end