class ReservationsController < ApplicationController
    # before_action :pre_process_params, only:[:confirm,:create]
    before_action :authenticate_user!

    def new
        logger.debug("============================ current_user = #{current_user.name}")
        @reservation = Reservation.new
        # @contents = RequestContent.all
        @date = params[:date]
        @frame = params[:frame]
        logger.debug("============================ @date  = #{@date.to_date.wday}")
        logger.debug("============================ @frame  = #{@frame}")
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def index
        if current_user
            if User.find(current_user.id).user_type == "1"
                @reservations = Reservation.all
            else 
                @reservations = Reservation.where(user_id: current_user.id)
            end
            # logger.debug("============================----- weekday = #{Global::WEEKDAY[1]}")
        end
    end
    
    # ここから
    
    def my_reserved
        if User.find(current_user.id).user_type == "1"
            @reservations = Reservation.where('reserved_date >= ?', Date.today)
        else 
            @reservations = Reservation.where('user_id = ? and reserved_date >= ?',current_user.id, Date.today)
        end
        @reservations.each do |reservation|
            logger.debug("============================  @reservations = #{reservation.reserved_date}")
        end
    end
    
    def make_holiday
        
        @reservation = Reservation.new(user_id: 0,reserved_date: params[:date],reserved_space: params[:space], remarks: "休み")

        if @reservation.save
            flash[:notice] = "#{params[:date].to_date.strftime("%Y年 %-m月 %-d日")}の#{params[:space]}時〜を休みにしました"
            redirect_to reservations_path
        else
            flash[:notice] = "休み入力できませんでした"
            render "reservations/index"
        end
    end
    
    
    def create
        
        @reservation = Reservation.new(reservation_params)
        @user = User.find(current_user.id)
        
        
        respond_to do |format|
          if @reservation.save
            SampleMailer.send_when_create(@reservation,@user).deliver
            AdminMailer.send_when_reserved(@reservation,@user).deliver
            format.html { redirect_to reservations_path, notice: 'User was successfully created.' }
            format.json { render :index, status: :created, location: @reservation }
          else
            format.html { render :index }
            format.json { render json: @reservation.errors, status: :unprocessable_entity }
          end
        end

        
        #   respond_to do |format|
        #       if @reservation.save
        # 　　　　ReserveMailer.send_when_reserved(@reservation,@user).deliver
        #         format.html { redirect_to @reservation, notice: 'User was successfully created.' }
        #         format.json { render :show, status: :created, location: @reservation }
        #       else
        #         format.html { render :new }
        #         format.json { render json: @reservation.errors, status: :unprocessable_entity }
        #       end
        #   end
    


        # logger.debug("============================create reserve_date  = #{params[:reservation][:reserved_date]}")
        # redirect_to reservations_path
    end
    
    def destroy
        @reservation = Reservation.find(params[:id])
        if @reservation.destroy
            flash[:notice] = "予約を取り消しました"
          redirect_to reservations_my_reserved_path
        else 
          redirect_back(fallback_location: reservations_path)
        end
    end
    
    private
        
        def reservation_params
            params.require(:reservation).permit(:user_id, :reserved_date, :remarks, :reserved_space)
        end
        
        
        def pre_process_params
            params[:reservation][:sex] = params[:reservation][:sex].to_i
            params[:reservation][:section] = params[:reservation][:section].to_i
        end
end

