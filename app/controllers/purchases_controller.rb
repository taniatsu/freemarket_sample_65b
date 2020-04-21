class PurchasesController < ApplicationController
  require 'payjp'

  def index
    @parents = Category.all.where(ancestry: nil)
    # @item = Item.find(1)
    @item = Item.find(params[:item_id])
    # @group = Group.find(params[:group_id])

    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to edit_card_path(current_user.id)
    else
      Payjp.api_key = "sk_test_7cd71a4afd3931baa6be94c1"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    # @item = Item.find(1)
    @item = Item.find(params[:item_id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_7cd71a4afd3931baa6be94c1"
    Payjp::Charge.create(
    :amount => @item.price , #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  def done
    @item = Item.find(1)
    @parents = Category.all.where(ancestry: nil)
  end
end