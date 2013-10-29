class RolesController < ApplicationController
  before_filter :find_role, :only=>[:show, :edit, :destroy, :update]

  before_filter :check_authorization_unless_modify_own_info, :only=>[:show]
  before_filter :check_authorization_unless_js_respond, :only=>[:index]
  skip_before_filter :check_authorization, :only=>[:settings, :update, :show, :index]

  def index
    if params[:term]
      @roles = Role.search_for_real_name(params[:term]).order(:name)
    else
      @roles = Role.order(:name)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
      format.js
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
    end
  end

  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  def edit
  end

  def create
    # convert_to_parent_id_from_real_name_if_necessary()
    @role = Role.new(params[:role])
    respond_to do |format|
      if @role.save
        format.html { redirect_to(roles_url,
          :notice => "Role #{@role.name} was successfully created.") }
        format.xml  { render :xml => @role,
          :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def update
    # convert_to_parent_id_from_real_name_if_necessary()
    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to(roles_path, # role_path((@role), 
          :notice => "Role #{@role.name} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @role.destroy
      flash[:notice] = "Role #{@role.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(roles_url) }
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

    def find_role
      @role = Role.find(params[:id])
    end


end
