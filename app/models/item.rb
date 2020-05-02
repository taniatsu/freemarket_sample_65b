class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments
  has_many :likes
  belongs_to :brand, optional: true
  belongs_to :category
  belongs_to :buyer,class_name: "User", optional: true
  belongs_to :seller,class_name: "User"

  enum size: { "XXS以下": 1, "XS（SS）": 2, "S": 3, "M": 4, "L": 5, "XXL": 6}, _prefix: true
  enum condition: { "新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}, _prefix: true
  enum fee_which: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _prefix: true
  enum delivery_date: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3},_prefix: true
  enum delivery: { "未定": 1, "らくらくメルカリ便": 2, "ゆうメール": 3, "レターパック": 4, "普通郵便(定形、定形外)": 5, "クロネコヤマト": 6, "ゆうパック": 7, "クリックポスト": 8, "ゆうパケット": 9}, _prefix: true

  validates_associated :images
  validates :images, presence: true
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