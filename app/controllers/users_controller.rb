class UsersController < ApplicationController
#  before_filter :authenticate_user!
  load_and_authorize_resource :find_by => :slug

  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end

end
