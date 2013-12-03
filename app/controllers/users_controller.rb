#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class UsersController < ApplicationController
  before_filter :find_user, :only=>[:show, :edit, :destroy, :update]
  # GET /users
  # GET /users.xml
  before_filter :check_authorization_unless_modify_own_info, :only=>[:show]
  before_filter :check_authorization_unless_js_respond, :only=>[:index]
  skip_before_filter :check_authorization, :only=>[:settings, :update, :show, :index, :list]

  def index
    if params[:term]
      @users = User.search_for_real_name(params[:term]).order(:real_name)
    else
      @users = User.order(:real_name)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.js
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def list
    if params[:term]
      @users = User.search_for_real_name(params[:term]).order(:real_name)
    else
      @users = User.order(:real_name)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.js
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  def settings
    @user = current_user
    render :action => "edit"
  end

  # POST /users
  # POST /users.xml
  def create
    convert_to_parent_id_from_real_name_if_necessary()
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_url,
          :notice => "User #{@user.name} was successfully created.") }
        format.xml  { render :xml => @user,
          :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    convert_to_parent_id_from_real_name_if_necessary()
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(user_path(@user),
          :notice => "User #{@user.name} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  private
    def check_authorization_unless_modify_own_info
      return true if current_user.can?(action_name, controller_name) || User.find(params[:id]) == current_user
      redirect_to root_url,
              :notice=>I18n.t("error.permit_deny")
    end

    def check_authorization_unless_js_respond
      return true if current_user.can?(action_name, controller_name) || request.xhr?
      redirect_to root_url,
              :notice=>I18n.t("error.permit_deny")
    end

    def convert_to_parent_id_from_real_name_if_necessary
      return if not params[:user].has_key?(:parent_id)
      if u = User.find_by_real_name(params[:user][:parent_id])
        params[:user][:parent_id] = u.id
      else
        params[:user][:parent_id] = nil
      end
    end

    def find_user
      @user = User.find(params[:id])
    end

end
