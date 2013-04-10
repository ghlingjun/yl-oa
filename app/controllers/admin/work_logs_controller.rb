class Admin::WorkLogsController < Admin::BaseController

  def index
    @work_logs = WorkLog.all
  end

  def show
  	@work_log = WorkLog.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work_log }
    end
  end
end