class HumanResource::BusinessTripApplicationsController < HumanResource::BaseController

  def index
    @business_trip_applications = BusinessTripApplication.where("state='approved'").paginate(:page => params[:page]).order('id DESC')
  end

  def show
    @business_trip_application = BusinessTripApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @business_trip_application }
    end
  end
end
