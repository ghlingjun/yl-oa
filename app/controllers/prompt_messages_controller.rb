class PromptMessagesController < ApplicationController
  def index
    @size = current_user.receive_messages.prompt_messages.size
    @prompt_messages = current_user.receive_messages.prompt_messages
    .paginate(:page => params[:page]).order('id DESC')
    @prompt_messages.each do |prompt_messages|
      MessageReceiver.read_message_if_necessary(prompt_messages, current_user)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prompt_messages}
    end
  end

  def show
    @prompt_message = PromptMessage.find(params[:id])
    MessageReceiver.read_message_if_necessary(@prompt_message, current_user)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prompt_message }
    end
    end

end
