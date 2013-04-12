class Sale::ContractApplicationsController < Sale::BaseController
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
end