class AdminMailer < ApplicationMailer
  def send_when_reserved(reservation)
    @reservation = reservation
    @user = User.find_by(user_type: "1")
    mail to:      @user.email,
    subject: 'm☆COSMIC ご予約を受けました'
  end
end



