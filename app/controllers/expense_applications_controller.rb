class ExpenseApplicationsController < ApplicationController

  def index
    @size = current_user.send_applications.expense_applications.size
    @expense_applications = current_user.send_applications.expense_applications
      .paginate(:page => params[:page]).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expense_applications }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @expense_application = ExpenseApplication.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expense_application }
    end
  end


  def create
    @expense_application = ExpenseApplication.new(params[:expense_application])
    @expense_application.sender = current_user

    respond_to do |format|
      if @expense_application.save
        format.html { redirect_to(@expense_application, :notice => 'expense_application was successfully created.') }
        format.xml  { render :xml => @expense_application, :status => :created, :location => @expense_application }
      else
        format.html { render "new" }
        format.xml  { render :xml => @expense_application.errors, :status => :unprocessable_entity }
      end
    end

  end

  def show
    @expense_application = ExpenseApplication.find(params[:id])
    # ExpenseApplication.find_by_message_and_receiver(@communicate_message, current_user).first.read_message!
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expense_application }
    end
  end

  def destroy
    @expense_application = ExpenseApplication.find(params[:id])
    @expense_application.destroy

    respond_to do |format|
      format.html { redirect_to(expense_applications_url, :notice=>"expense_application was successfully deleted.") }
      format.xml  { head :ok }
    end
  end

end
