class Item < ApplicationRecord
  has_many :images
  has_many :comments
  has_many :likes
  belongs_to :user
  # belongs_to :brand
  belongs_to :category
  belongs_to :buyer
  belongs_to :seller

  enum size: [:XXS以下, :"XS(SS)", :S, :M, :L, :"XL(LL)", :"2XL(3L)", :"3XL(4L)", :"4XK(5L)以上", :"FREE SIZE"]
  enum condition: [:"新品・未使用", :"目立った傷や汚れなし", :"やや傷や汚れあり", :"傷や汚れあり", :"全体的に状態が悪い"]
  enum fee_which: [:"送料込み（出品者負担）" ,:"着払い（購入者負担）"]
  enum status: [:"らくらくフリマ便"]
  enum delivery_date: [:"1~2日で発送", :"2~3日で発送", :"4~7日で発送"]
end
