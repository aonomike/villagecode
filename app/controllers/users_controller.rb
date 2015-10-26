class UsersController < ApplicationController
#  before_filter :authenticate_user!
  load_and_authorize_resource :find_by => :slug
  skip_before_filter :verify_authenticity_token ,:only=>[:change_role]

  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def change_role
    user = User.find(params[:user][:id])
    user.roles.clear
    user.roles << Role.find_by_name(params[:user][:role])
    flash[:notice]="Role successfully altered"
    render :js => "window.location = '#{users_path}'"
  end

end
