class UsersController < ApplicationController
  
  def index
    logger.debug("============================== 普通のuser_controller の　users index ")
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if User.update(update_params)
      flash[:notice]  = "更新できました"
      redirect_to users_path
    else 
      flash[:notice]  = "更新できませんでした"
      render "users/edit"     
    end
    
    
  end
  
  private
        
      def update_params
          params.require(:user).permit(:email, :name, :name_kana, :tel, :birthday, :introducer, :gender, :remarks, :user_type)
      end
  
  
end
