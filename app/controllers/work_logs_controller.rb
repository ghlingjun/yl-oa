class WorkLogsController < ApplicationController
  # GET /work_logs
  # GET /work_logs.json
  def index
    if params[:flag] == "subordinate"
      @work_logs = current_user.get_children_work_logs
      .paginate(:page => params[:page]).order('id DESC')
    else
      @work_logs = current_user.work_logs
      .paginate(:page => params[:page]).order('id DESC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_logs }
    end
  end

  # GET /work_logs/1
  # GET /work_logs/1.json
  def show
    @work_log = WorkLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_log }
    end
  end

  # GET /work_logs/new
  # GET /work_logs/new.json
  def new
    @work_log = WorkLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_log }
    end
  end

  # GET /work_logs/1/edit
  def edit
    @work_log = WorkLog.find(params[:id])
  end

  # POST /work_logs
  # POST /work_logs.json
  def create
    @work_log = WorkLog.new(params[:work_log])
    @work_log.user = current_user

    respond_to do |format|
      if @work_log.save
        format.html { redirect_to @work_log, notice: 'Work log was successfully created.' }
        format.json { render json: @work_log, status: :created, location: @work_log }
      else
        format.html { render action: "new" }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_logs/1
  # PUT /work_logs/1.json
  def update
    @work_log = WorkLog.find(params[:id])

    respond_to do |format|
      if @work_log.update_attributes(params[:work_log])
        format.html { redirect_to @work_log, notice: 'Work log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_logs/1
  # DELETE /work_logs/1.json
  def destroy
    @work_log = WorkLog.find(params[:id])
    @work_log.destroy

    respond_to do |format|
      format.html { redirect_to work_logs_url }
      format.json { head :no_content }
    end
  end
end
