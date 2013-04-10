class CommunicateMessagesController < ApplicationController

  def index
    if params[:flag] == "send"
      @size = current_user.send_messages.communicate_messages.size
      @communicate_messages = current_user.send_messages.communicate_messages
      .paginate(:page => params[:page]).order('id DESC')
      @send = true
    elsif  params[:flag] == "receive"
      @size = current_user.receive_messages.communicate_messages.size
      @communicate_messages = current_user.receive_messages.communicate_messages
      .paginate(:page => params[:page]).order('id DESC')
      @send = false
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @communicate_message = CommunicateMessage.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @communicate_message }
    end
  end


  def create
    params[:communicate_message][:receiver_ids] = get_user_ids_by_real_names(params[:communicate_message][:receiver_ids])

    @communicate_message = CommunicateMessage.new(params[:communicate_message])
    @communicate_message.sender = current_user

    respond_to do |format|
      if @communicate_message.save
        format.html { redirect_to(@communicate_message, :notice => 'communicate_message was successfully created.') }
        format.xml  { render :xml => @communicate_message, :status => :created, :location => @communicate_message }
      else
        format.html { render "new" }
        format.xml  { render :xml => @communicate_message.errors, :status => :unprocessable_entity }
      end
    end

  end

  def show
    @communicate_message = CommunicateMessage.find(params[:id])
    MessageReceiver.read_message_if_necessary(@communicate_message, current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @communicate_message }
    end
  end

end
