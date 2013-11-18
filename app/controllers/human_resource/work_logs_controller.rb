class HumanResource::WorkLogsController < HumanResource::BaseController

  def index
    unless params[:q].nil?
      return @work_logs = User.find_by_real_name(params[:real_name]).work_logs.
          filter_by_month(params[:q].to_date).paginate(:page => params[:page]).order('id DESC')
    end
    @work_logs = User.find_by_real_name(params[:real_name]).work_logs.paginate(:page => params[:page]).order('id DESC')
  end

  def statistics
    @statistics = WorkLog.statistics_by_user(params[:user_name], params[:filter_date].nil? ? nil : params[:filter_date].to_date)
  end

end