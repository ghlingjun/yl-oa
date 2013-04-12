class Finance::ContractApplicationsController < Finance::BaseController
  def index
    @contract_applications = ContractApplication.where("state='approved'").paginate(:page => params[:page]).order('id DESC')
  end

  def show
  	@contract_application = ContractApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contract_application }
    end
  end

  def edit
    @contract_application = ContractApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.xml  { render :xml => @contract_application }
    end
  end

  def update
    @contract_application = ContractApplication.find(params[:id])

    respond_to do |format|
      if @contract_application.update_attributes(params[:contract_application])
        format.html { redirect_to(finance_contract_applications_path, :notice => 'contract_application was successfully update.') }
      else
        format.html { render "edit" }
      end
    end
  end

end