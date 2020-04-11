class Card < ApplicationRecord
  belongs_to :user

  # validates :number, presence: true, length: { maximum: 16 }
  # validates :exp_month, presence: true
  # validates :exp_year, presence: true
  # validates :cvc, presence: true
end
