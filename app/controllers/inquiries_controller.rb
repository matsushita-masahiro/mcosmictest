class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save 
      flash[:notice] = "下記内容でお問い合わせを受け付けました"
      redirect_to inquiry_path(@inquiry)
    else
      flash[:notice] = "お問い合わせを受け付けできませんでした"
      render "inquiries/new"
    end
  end
  
  def show
    @inquiry = Inquiry.find(params[:id])
  end
  
  private 
    def inquiry_params
        params.require(:inquiry).permit(:user_id, :name, :email, :content)
    end
  
  
end
