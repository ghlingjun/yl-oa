class CertificationApplicationsController < ApplicationController

  def index
    @certification_applications = current_user.certification_applications.paginate(:page => params[:page]).order('id DESC')
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @certification_application = CertificationApplication.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @certification_application = CertificationApplication.new(params[:certification_application])
    @certification_application.user = current_user

    respond_to do |format|
      if @certification_application.save
        format.html { redirect_to(@certification_application, :notice => 'certification_application was successfully created.') }
      else
        format.html { render "new" }
      end
    end

  end

  def show
    @certification_application = CertificationApplication.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
    @certification_application = CertificationApplication.find(params[:id])
  end

  def update
    @certification_application = CertificationApplication.find(params[:id])
    respond_to do |format|
      if @certification_application.update_attributes(params[:certification_application])
        format.html { redirect_to(@certification_application, :notice => 'certification_application was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

end
