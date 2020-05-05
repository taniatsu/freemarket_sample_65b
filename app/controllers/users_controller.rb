class UsersController < ApplicationController
  before_action :set_parents, only: [:show, :edit]

  def show
  end

  def edit
  end

  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end
