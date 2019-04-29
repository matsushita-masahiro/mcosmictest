class SampleMailer < ApplicationMailer
  def send_when_create(reservation,user)
    @reservation = reservation
    @user = user
    mail to:      user.email,
    subject: 'こんにちは！新しいユーザーが追加されました'
  end
end

