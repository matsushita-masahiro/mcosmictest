class SignupMailer < ApplicationMailer
  def send_when_signup(user)
    @user = user
    mail to:      @user.email,
    subject: 'm☆COSMIC　無料会員登録'
  end
  
  def send_when_signup_admin(user)
    @user = user
    mail to:      User.find_by(user_type: "1").email,
    subject: 'm☆COSMIC　無料会員登録報告'
  end  
end
