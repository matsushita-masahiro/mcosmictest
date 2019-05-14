class InquiryMailer < ApplicationMailer
  def send_when_inquiry(inquiry)
    @inquiry = inquiry
    mail to:      @inquiry.email,
    subject: 'm☆COSMIC お問合せ確認'
  end
  
  def send_when_inquiry_admin(inquiry)
    @inquiry = inquiry
    mail to:      User.find_by(user_type: "1").email,
    subject: 'm☆COSMIC　お問合せ受信'
  end
  
  def send_when_answer(answer,inquiry)
    @inquiry = inquiry
    logger.debug("======----------------------- send_when_answer email = #{inquiry}")
    @answer = answer
    mail to:      @inquiry.email,
    subject: 'm☆COSMIC お問合せへのご回答'
  end
  
  def send_when_answer_admin(answer,inquiry)
    @inquiry = inquiry
    @answer = answer
    mail to:      User.find_by(user_type: "1").email,
    subject: 'm☆COSMIC　お問合せへの回答'
  end
  
  
  
end
