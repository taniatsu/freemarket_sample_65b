class SignupController < ApplicationController
  before_action :validates_step1, only: :sms_confirmation
  before_action :validates_step2, only: :address
  before_action :validates_step3, only: :create
  
  def index
  end

  def registration
    @user = User.new
  end

  def sms_confirmation
    @user = User.new
    session["devise.facebook_data"] = nil
    session["devise.google_data"] = nil

    if verify_recaptcha 
      render action: 'sms_confirmation' # trueなら次のページ
    else
      render registration_signup_index_path    # falseなら再度入力
    end
  end

  def address
    @user = User.new
  end


  def validates_step1
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_jp_name] = user_params[:last_jp_name]
    session[:first_jp_name] = user_params[:first_jp_name]
    session[:year_id] = user_params[:year_id]
    session[:month_id] = user_params[:month_id]
    session[:day_id] = user_params[:day_id]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_jp_name: session[:last_jp_name],
      first_jp_name: session[:first_jp_name],
      year_id: session[:year_id],
      month_id: session[:month_id],
      day_id: session[:day_id]
    )
    @user.errors.full_messages
    render registration_signup_index_path unless @user.valid?(:validates_step1)
  end

  def validates_step2
    session[:tel] = user_params[:tel]
    @user = User.new(tel: session[:tel])
    render sms_confirmation_signup_index_path unless @user.valid?(:validates_step2)
  end

  def validates_step3
    session[:zip_code] = user_params[:zip_code]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building] = user_params[:building]
    session[:telephone] = user_params[:telephone]

    @user = User.new(
      zip_code: session[:zip_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      address: session[:address],
      building: session[:building],
      telephone: session[:telephone]
    )
    render address_signup_index_path unless @user.valid?(:validates_step3)
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    session[:zip_code] = user_params[:zip_code]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building] = user_params[:building]
    session[:telephone] = user_params[:telephone]
    @user = User.new(
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    last_name: session[:last_name],
    first_name: session[:first_name],
    last_jp_name: session[:last_jp_name],
    first_jp_name: session[:first_jp_name],
    year_id: session[:year_id],
    month_id: session[:month_id],
    day_id: session[:day_id],
    tel: session[:tel],
    zip_code: session[:zip_code],
    prefecture_id: session[:prefecture_id],
    city: session[:city],
    address: session[:address],
    building: session[:building],
    telephone: session[:telephone]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/registration'
    end
  end

  private
# 許可するキーを設定
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_jp_name,
      :first_jp_name,
      :year_id,
      :month_id,
      :day_id,
      :tel,
      :zip_code,
      :prefecture_id,
      :city,
      :address,
      :building,
      :telephone
    )
  end
end