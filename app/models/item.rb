class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments
  has_many :likes
  belongs_to :category
  belongs_to :buyer, optional: true, class_name: "User"
  belongs_to :seller, class_name: "User"

  validates_associated :images
  validates :images, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :size, presence: true
  validates :condition, presence: true
  validates :fee_which, presence: true
  validates :from_where, presence: true
  validates :delivery_date, presence: true
  validates :price, presence: true

  enum condition: { "新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}, _prefix: true
  enum size: { "XXS以下": 1, "XS（SS）": 2, "S": 3, "M": 4, "L": 5, "XXL": 6}, _prefix: true
  enum fee_which: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _prefix: true
  enum delivery: { "未定": 1, "らくらくメルカリ便": 2, "ゆうメール": 3, "レターパック": 4, "普通郵便(定形、定形外)": 5, "クロネコヤマト": 6, "ゆうパック": 7, "クリックポスト": 8, "ゆうパケット": 9}, _prefix: true
  enum from_where: { 北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7, 東京都: 8, 神奈川県: 9, 埼玉県: 10, 千葉県: 11, 茨城県: 12, 栃木県: 13, 群馬県: 14, 山梨県: 15, 新潟県: 16, 長野県: 17, 富山県: 18, 石川県: 19, 福井県: 20, 愛知県: 21, 岐阜県: 22, 静岡県: 23, 三重県: 24, 大阪府: 25, 兵庫県: 26, 京都府: 27, 滋賀県: 28, 奈良県: 29, 和歌山県: 30, 鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35, 徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39, 福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46, 沖縄県: 47}, _prefix: true
  enum delivery_date: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3},_prefix: true
end