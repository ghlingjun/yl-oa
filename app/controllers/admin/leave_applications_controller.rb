class Admin::LeaveApplicationsController < Admin::BaseController

  def index
    @leave_applications = LeaveApplication.where("state='approved'").paginate(:page => params[:page]).order('id DESC')
  end

  def show
    @leave_application = LeaveApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @leave_application }
    end
  end
end
