class ItemApplicationsController < ApplicationController

  before_filter :get_type_value
  def index
    @item_applications = current_user.send_applications.item_applications
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_application }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @item_application = ItemApplication.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_application }
    end
  end


  def create
    @item_application = ItemApplication.new(params[:item_application])
    @item_application.sender = current_user

    respond_to do |format|
      if @item_application.save
        format.html { redirect_to(@item_application, :notice => 'item_application was successfully created.') }
        format.xml  { render :xml => @item_application, :status => :created, :location => @item_application }
      else
        format.html { render "new" }
        format.xml  { render :xml => @item_application.errors, :status => :unprocessable_entity }
      end
    end

  end

  def show
    @item_application = ItemApplication.find(params[:id])
    # itemApplication.find_by_message_and_receiver(@communicate_message, current_user).first.read_message!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_application }
    end
  end

  private
    def get_type_value
      @type = "item_application"
    end
  
end
