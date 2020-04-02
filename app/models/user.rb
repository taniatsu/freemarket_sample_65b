class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i

  # registrationの項目
  validates :nickname, presence: true, length: { maximum: 12 }
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX,  message: 'は不適切です'}
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_jp_name, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :first_jp_name, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :year_id, presence: true
  validates :month_id, presence: true
  validates :day_id, presence: true
  validates :password, presence: true, allow_blank: true
  validates :password, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX }
  # sms_comfirmationの項目
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }
  # addressの項目
  validates :zip_code, presence: true
  validates :prefecture_id, presence: true, numericality: { only_integer: true }
  validates :city, presence: true
  validates :address, presence: true
  # 建物の名前、お届け先の練和番号は任意の為、項目はなし

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :year
    belongs_to_active_hash :month
    belongs_to_active_hash :day
    belongs_to_active_hash :prefecture

end
