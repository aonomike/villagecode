class UsersController < ApplicationController
#  before_filter :authenticate_user!
  load_and_authorize_resource :find_by => :slug
  skip_before_filter :verify_authenticity_token ,:only=>[:change_role,:filter]

  def index
    if current_user && current_user.role?(:super_admin)
      @users = User.all
    end
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def change_role
    user = User.find(params[:user][:id])
    if params[:user][:role]
      user.roles.clear
      user.roles << Role.find_by_name(params[:user][:role])
      flash[:notice]="Role successfully altered"
      render :js => "window.location = '#{users_path}'"
    else
      flash[:notice]="Nothing to do"
      render :js => "window.location = '#{users_path}'"
    end
  end

  def filter
    if(params[:role]!="Default")
      @users =  Role.find_by_name(params[:role]).users
    else
      @users =User.all
    end
    if(@users.size>0)
      render :partial => "users/filterresults", :layout => false, :locals => {:searchresults => @users}
    else
      render :text => "empty"
    end
  end

end
