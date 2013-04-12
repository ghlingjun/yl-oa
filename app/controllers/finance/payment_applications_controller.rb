class Finance::PaymentApplicationsController < Finance::BaseController
  def index
    @payment_applications = PaymentApplication.where("state='approved'").paginate(:page => params[:page]).order('id DESC')
  end

  def show
  	@payment_application = PaymentApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_application }
    end
  end

  def edit
    @payment_application = PaymentApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.xml  { render :xml => @payment_application }
    end
  end

  def update
    @payment_application = PaymentApplication.find(params[:id])

    respond_to do |format|
      if @payment_application.update_attributes(params[:payment_application])
        format.html { redirect_to(finance_payment_applications_path, :notice => 'payment_application was successfully update.') }
      else
        format.html { render "edit" }
      end
    end
  end
end