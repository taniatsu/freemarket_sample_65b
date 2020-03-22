class SignupController < ApplicationController
  
  def index
  end

  def registration
    @user = User.new
  end

  def sms_confirmation
    @user = User.new
  end

  def address
    @user = User.new
  end

end
