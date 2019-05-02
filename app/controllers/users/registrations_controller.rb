# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    logger.debug("====================== create")
    super
  end

  # GET /resource/edit
  def edit
    logger.debug("====================== edit")
    super
  end

  # PUT /resource
  def update
    logger.debug("====================== update")
    super
      @user = User.last
      # if @user.email == ENV['USER_EMAIL']
      @user = User.last
      logger.debug("====================== update user = #{@user.email}")
      if @user.email == "mstarcosmic@gmail.com"
         @user.user_type = "1"
         flash[:notice] = "管理者登録できました"  
      end
      if @user.save
        SignupMailer.send_when_signup(@user).deliver
        SignupMailer.send_when_signup_admin(@user).deliver
      end

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :name_kana, :tel, :birthday, :introducer, :gender, :remarks, :user_type, :membership_number])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    edit_user_registration_path
  end
end
