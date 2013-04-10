class NoticesController < ApplicationController
  before_filter :find_notice, :only=>[:show, :edit, :update, :destroy]
  # GET /notices
  # GET /notices.xml
  def index
    @notices = Notice.paginate(:page => params[:page]).order('id DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notices }
    end
  end

  # GET /notices/1
  # GET /notices/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notice }
    end
  end

  # GET /notices/new
  # GET /notices/new.xml
  def new
    @notice = Notice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notice }
    end
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.xml
  def create
    @notice = Notice.new(params[:notice])
    @notice.user = current_user
    
    respond_to do |format|
      if @notice.save
        format.html { redirect_to(@notice, :notice => 'Notice was successfully created.') }
        format.xml  { render :xml => @notice, :status => :created, :location => @notice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notices/1
  # PUT /notices/1.xml
  def update
    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        format.html { redirect_to(@notice, :notice => 'Notice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.xml
  def destroy
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to(notices_url) }
      format.xml  { head :ok }
    end
  end

  private
    def find_notice
      @notice = Notice.find(params[:id])
    end
end
