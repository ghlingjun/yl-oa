class ContractApplicationsController < ApplicationController

  def index
    @size = current_user.send_applications.contract_applications.size
    @contract_applications = current_user.send_applications.contract_applications
      .paginate(:page => params[:page]).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contract_applications }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @contract_application = ContractApplication.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contract_application }
    end
  end


  def create
    @contract_application = ContractApplication.new(params[:contract_application])
    @contract_application.sender = current_user

    respond_to do |format|
      if @contract_application.save
        format.html { redirect_to(@contract_application, :notice => 'contract_application was successfully created.') }
        format.xml  { render :xml => @contract_application, :status => :created, :location => @contract_application }
      else
        format.html { render "new" }
        format.xml  { render :xml => @contract_application.errors, :status => :unprocessable_entity }
      end
    end

  end

  def show
    @contract_application = ContractApplication.find(params[:id])
    # ContractApplication.find_by_message_and_receiver(@communicate_message, current_user).first.read_message!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contract_application }
    end
  end
end