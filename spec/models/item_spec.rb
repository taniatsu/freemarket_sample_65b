require 'rails_helper'

describe Item do
  describe '#create' do
    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "explanationがない場合は登録できないこと" do
      item = build(:item, explanation: "")
      item.valid?
      expect(item.errors[:explanation]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "sizeがない場合は登録できないこと" do
      item = build(:item, size: "")
      item.valid?
      expect(item.errors[:size]).to include("を入力してください")
    end

    it "fee_whichがない場合は登録できないこと" do
      item = build(:item, fee_which: "")
      item.valid?
      expect(item.errors[:fee_which]).to include("を入力してください")
    end

    it "from_whereがない場合は登録できないこと" do
      item = build(:item, from_where: "")
      item.valid?
      expect(item.errors[:from_where]).to include("を入力してください")
    end

    it "delivery_dateがない場合は登録できないこと" do
      item = build(:item, delivery_date: "")
      item.valid?
      expect(item.errors[:delivery_date]).to include("を入力してください")
    end
  end
end