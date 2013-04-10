class Finance::ExpenseApplicationsController < Finance::BaseController
  def index
    @expense_applications = ExpenseApplication.where("state='approved'")
  end

  def show
  	@expense_application = ExpenseApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expense_application }
    end
  end
end
