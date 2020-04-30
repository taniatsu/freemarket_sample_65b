class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i

  # registrationの項目
  validates :nickname, presence: true, length: { maximum: 12 }
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX,  message: 'は不適切です'}
  validates :last_name, :first_name, :year_id, :month_id, :day_id, presence: true
  validates :last_jp_name, :first_jp_name, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカナ入力です' }
  validates :password, :password_confirmation, presence: true, length: { maximum: 7 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字で入力してください' }
  # sms_comfirmationの項目
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX, message: 'は数字で入力してください' }
  # addressの項目
  validates :zip_code, :city, :address, presence: true
  validates :prefecture_id, presence: true, numericality: { only_integer: true }
  # 建物の名前、お届け先の練和番号は任意の為、項目はなし

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :year
    belongs_to_active_hash :month
    belongs_to_active_hash :day
    belongs_to_active_hash :prefecture

end
