class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i

  # validates :nickname, presence: true, length: { maximum: 12 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_jp_name, presence: true, length: { maximum: 20 }, format: { with: VALID_KATAKANA_REGEX }
  validates :first_jp_name, presence: true, length: { maximum: 20 }, format: { with: VALID_KATAKANA_REGEX }

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :year
    belongs_to_active_hash :month
    belongs_to_active_hash :day
end
