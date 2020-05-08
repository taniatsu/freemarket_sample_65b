class SignupController < ApplicationController
  
  def index
  end

  def registration
    @user = User.new
  end

  def sms_confirmation
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
      day_id: session[:day_id],
      tel: '09012345678',
      zip_code: '1234567',
      prefecture_id: '1',
      city: '札幌',
      address: '中央区',
      building: 'ビル',
      telephone: '08098765432'
    )
    render '/signup/registration' unless @user.valid?
  end

  def address
    session[:tel] = user_params[:tel]
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
      tel: '09012345678',
      zip_code: '1234567',
      prefecture_id: '1',
      city: '札幌',
      address: '中央区',
      building: 'ビル',
      telephone: '08098765432'
    )
    render '/signup/sms_confirmation' unless @user.valid?
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
      render '/signup/address'
    end

    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
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