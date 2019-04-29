class UserTypesController < ApplicationController
  
  def index
    @user_types = UserType.all
  end
  
  def edit
    @user_type = UserType.find(params[:id])
  end
  
  def update
    @user_type = UserType.update(user_type_params)
    # @user_type.save
    redirect_to user_types_path
  end
  
  private
    def user_type_params
        params.require(:user_type).permit(:user_type, :type_name, :price)
    end
end
