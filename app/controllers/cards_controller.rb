class CardsController < ApplicationController

  # before_action :get_user_params, only: [:edit, :confirmation, :show]
  before_action :get_payjp_info, only: [:new_create, :create, :delete, :show]

  def edit
    @parents = Category.all.where(ancestry: nil)
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "edit", id: current_user.id
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "edit", id: current_user.id
      end
    end
  end

  def delete
    @parents = Category.all.where(ancestry: nil)
    @card = current_user.cards.first
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      # render action: "edit", id: current_user.id
    end
      # redirect_to action: "edit", id: current_user.id
  end

  def show
    @parents = Category.all.where(ancestry: nil)
    card = current_user.cards.first
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to action: "confirmation", id: current_user.id
    end
  end

  def confirmation
    @parents = Category.all.where(ancestry: nil)
    card = current_user.cards
    redirect_to action: "show" if card.exists?
  end

  private

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = "sk_test_7cd71a4afd3931baa6be94c1"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end

end
