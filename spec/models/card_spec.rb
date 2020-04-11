require 'rails_helper'

describe Card do
  describe '#create' do
    it "numberがない場合は登録できないこと" do
      card = build(:card, number: nil)
      card.valid?
      expect(card.errors[:number]).to include("を入力してください")
    end

    it "numberが16桁以上であれば登録できないこと" do
      card = build(:card, number: "12345678123456789")
      card.valid?
      expect(card.errors[:number]).to include("長すぎます（最大16桁です）")
    end

    it "numberが16桁で登録できること " do
      card = build(:card, number: "1234567812345678")
      expect(card).to be_valid
    end

    it "numberが16桁未満であれば登録できないこと" do
      card = build(:card, number: "123456781234567")
      card.valid?
      expect(card.errors[:number]).to include("短すぎます")
    end

    it "monthがない場合は登録できないこと" do
      card = build(:card, exp_month: nil)
      card.valid?
      expect(card.errors[:exp_month]).to include("を入力してください")
    end

    it "yearがない場合は登録できないこと" do
      card = build(:card, exp_year: nil)
      card.valid?
      expect(card.errors[:exp_year]).to include("を入力してください")
    end

    it "cvcがない場合は登録できないこと" do
      card = build(:card, cvc: nil)
      card.valid?
      expect(card.errors[:cvc]).to include("を入力してください")
    end

    it "cvcが5桁以上であれば登録できないこと" do
      card = build(:card, cvc: "12345")
      card.valid?
      expect(card.errors[:cvc]).to include("長すぎます（最大4桁です）")
    end

    it "cvcが4桁で登録できること " do
      card = build(:card, cvc: "1234")
      expect(card).to be_valid
    end

    it "cvcが3桁で登録できること " do
      card = build(:card, cvc: "123")
      expect(card).to be_valid
    end

    it "numberが3桁未満であれば登録できないこと" do
      card = build(:card, cvc: "12")
      card.valid?
      expect(card.errors[:cvc]).to include("短すぎます")
    end
  end
end