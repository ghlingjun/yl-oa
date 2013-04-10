class ApplicationReceiversController < ApplicationController

  def index
    @application_receivers = current_user.application_receivers
    .paginate(:page => params[:page]).order('id DESC')
  end

  def edit
    @application_receiver = ApplicationReceiver.find(params[:id])
  end

  def update
    @application_receiver = ApplicationReceiver.find(params[:id])

    respond_to do |format|
      if @application_receiver.update_attribute_wrap(params[:application_receiver])
        format.html { redirect_to(application_receivers_path, :notice => 'application_receiver was successfully update.') }
      else
        format.html { render "edit" }
      end
    end
  end

end
