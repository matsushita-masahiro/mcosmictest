class HomeController < ApplicationController
  
  def top
  end
  
  def readme
    @user = User.find(current_user.id)
  end
  
end
