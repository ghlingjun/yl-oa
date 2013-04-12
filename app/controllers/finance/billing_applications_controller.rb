class Finance::BillingApplicationsController < Finance::BaseController
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

  def edit
    @billing_application = BillingApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.xml  { render :xml => @billing_application }
    end
  end

  def update
    @billing_application = BillingApplication.find(params[:id])

    respond_to do |format|
      if @billing_application.update_attributes(params[:billing_application])
        format.html { redirect_to(finance_billing_applications_path, :notice => 'billing_application was successfully update.') }
      else
        format.html { render "edit" }
      end
    end
  end

end