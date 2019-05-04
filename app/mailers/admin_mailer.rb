class AdminMailer < ApplicationMailer
  def send_when_reserved(reservation,user)
    @reservation = reservation
    @admin = User.find_by(user_type: "1")
    @user = user
    mail to:      @admin.email,
    subject: 'm☆COSMIC ご予約を受けました'
  end
end



