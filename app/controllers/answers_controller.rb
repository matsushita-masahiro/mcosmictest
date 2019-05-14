class AnswersController < ApplicationController
  
  def new
    @inquiry = Inquiry.find(params[:id])
    @answer = Answer.new(inquiry_id: @inquiry.id)
  end
  
  def index
    @inquiries = Inquiry.all
  end
    
  
  def create
    @answer = Answer.new(answer_params)
    @inquiry = Inquiry.find(@answer.inquiry_id)
    logger.debug("======================== answer create @inquiry.email = #{@inquiry.email}")
    @answer.user_id = current_user.id
    
        respond_to do |format|
          if @answer.save
            InquiryMailer.send_when_answer(@answer,@inquiry).deliver
            InquiryMailer.send_when_answer_admin(@answer,@inquiry).deliver
            format.html { redirect_to answer_path(@answer), notice: "回答しました" }
            format.json { render :index, status: :created, location: @answer }
          else
            format.html { render :index, notice: "回答できませんでした"  }
            format.json { render json: @answer.errors, status: :unprocessable_entity }
          end
        end    
    
    
  end
    
  def show
    @answer = Answer.find(params[:id])
    @inquiry = Inquiry.find(@answer.inquiry_id)
  end
    

  
  private 
    def answer_params
        params.require(:answer).permit(:inquiry_id, :comment)
    end
end
