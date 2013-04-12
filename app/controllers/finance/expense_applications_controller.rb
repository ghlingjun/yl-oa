class Finance::ExpenseApplicationsController < Finance::BaseController
  def index
    @expense_applications = ExpenseApplication.where("state='approved'").paginate(:page => params[:page]).order('id DESC')
  end

  def show
  	@expense_application = ExpenseApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expense_application }
    end
  end

  def edit
    @expense_application = ExpenseApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.xml  { render :xml => @expense_application }
    end
  end

  def update
    @expense_application = ExpenseApplication.find(params[:id])

    respond_to do |format|
      if @expense_application.update_attributes(params[:expense_application])
        format.html { redirect_to(finance_expense_applications_path, :notice => 'expense_application was successfully update.') }
      else
        format.html { render "edit" }
      end
    end
  end
end
