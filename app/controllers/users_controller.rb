class UsersController < ApplicationController
  def show
    @parents = Category.all.where(ancestry: nil)
    # user = User.find(params[:id])
    @nickname = current_user.nickname
    
  end

  def edit
  end
end
