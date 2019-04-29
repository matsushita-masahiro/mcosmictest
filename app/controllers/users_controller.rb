class UsersController < ApplicationController
  
  def index
    logger.debug("============================== users index")
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
