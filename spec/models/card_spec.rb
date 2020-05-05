require 'rails_helper'

describe Card do
  describe '#create' do
    it "use_idがない場合は登録できないこと" do
      # user = create(:user)
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user_id]).to include()
    end

    it "customer_idがない場合は登録できないこと" do
      # user = create(:user)
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include()
    end

    it "card_idがない場合は登録できないこと" do
      # user = create(:user)
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include()
    end

  end
end