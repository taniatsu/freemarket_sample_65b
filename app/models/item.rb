class Item < ApplicationRecord
  has_many :images
  has_many :comments
  has_many :likes
  belongs_to :use, optional: true
  belongs_to :category
  belongs_to :buyer,class_name: "User", optional: true
  belongs_to :seller,class_name: "User"

  enum size: {"XXS以下": 0, "XS(SS)": 1, S: 2, M: 3, L: 4, "XL(LL)": 5, "2XL(3L)": 6, "3XL(4L)": 7, "4XK(5L)以上": 8, "FREE SIZE": 9}
  enum condition: {"新品・未使用": 0, "目立った傷や汚れなし": 1, "やや傷や汚れあり": 2, "傷や汚れあり": 3, "全体的に状態が悪い": 4}
  enum fee_which: {"送料込み（出品者負担）":0 ,"着払い（購入者負担）":1}
  enum delivery_date: {"1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送":3 }

  validates :category_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
  validates :from_where, presence: true
  # 画像投稿実装できていないのでとりあえずthumbnailはコメントアウト
  # validates :thumbnail, presence: true
  validates :size, presence: true
  validates :condition, presence: true
  validates :fee_which, presence: true
  validates :delivery_date, presence: true
  
end
