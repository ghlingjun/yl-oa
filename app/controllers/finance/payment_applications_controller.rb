class Finance::PaymentApplicationsController < Finance::BaseController
  def index
    @payment_applications = PaymentApplication.where("state='approved'")
  end

  def show
  	@payment_application = PaymentApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_application }
    end
  end
end