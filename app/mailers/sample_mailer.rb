class SampleMailer < ApplicationMailer
  def send_when_create(reservation,user)
    @reservation = reservation
    @user = user
    mail to:      @user.email,
    subject: 'm☆COSMIC ご予約確認'
  end
end

