class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
        
        respond_to do |format|
          if @inquiry.save
            InquiryMailer.send_when_inquiry(@inquiry).deliver
            InquiryMailer.send_when_inquiry_admin(@inquiry).deliver
            format.html { redirect_to inquiry_path(@inquiry), notice: "下記内容でお問い合わせを受け付けました" }
            format.json { render :index, status: :created, location: @inquiry }
          else
            format.html { render :index, notice: "お問い合わせを受け付けできませんでした"  }
            format.json { render json: @inquiry.errors, status: :unprocessable_entity }
          end
        end
    

    
    # if @inquiry.save 
    #   flash[:notice] = "下記内容でお問い合わせを受け付けました"
    #   redirect_to inquiry_path(@inquiry)
    # else
    #   flash[:notice] = "お問い合わせを受け付けできませんでした"
    #   render "inquiries/new"
    # end
  end
  
  def index
    @inquiries = Inquiry.all.order(created_at: :desc)
  end
  
  # def answer
  #   @inquiry = Inquiry.find(params[:id])
  #   @user = User.find_by(user_type: "a")
  #   @answer = Answer.new(inquiry_id: @inquiry.id, user_id: @user.id)
  # end
  
  def show
    @inquiry = Inquiry.find(params[:id])
  end
  
  private 
    def inquiry_params
        params.require(:inquiry).permit(:user_id, :name, :email, :content)
    end
  
  
end
