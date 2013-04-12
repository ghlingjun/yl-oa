class Sale::BillingApplicationsController < Sale::BaseController
  def index
    @billing_applications = BillingApplication.where("state='approved'").paginate(:page => params[:page]).order('id DESC')
  end

  def show
  	@billing_application = BillingApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @billing_application }
    end
  end
end