require 'rails_helper'
describe User do
  
  describe '#create' do

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "last_jp_nameがない場合は登録できないこと" do
      user = build(:user, last_jp_name: nil)
      user.valid?
      expect(user.errors[:last_jp_name]).to include("を入力してください")
    end
    
    it "first_jp_nameがない場合は登録できないこと" do
      user = build(:user, first_jp_name: nil)
      user.valid?
      expect(user.errors[:first_jp_name]).to include("を入力してください")
    end
    
    it "year_idがない場合は登録できないこと" do
      user = build(:user, year_id: nil)
      user.valid?
      expect(user.errors[:year_id]).to include("を入力してください")
    end
    
    it "month_idがない場合は登録できないこと" do
      user = build(:user, month_id: nil)
      user.valid?
      expect(user.errors[:month_id]).to include("を入力してください")
    end
    
    it "day_idがない場合は登録できないこと" do
      user = build(:user, day_id: nil)
      user.valid?
      expect(user.errors[:day_id]).to include("を入力してください")
    end
    
    it "telがない場合は登録できないこと" do
      user = build(:user, tel: nil)
      user.valid?
      expect(user.errors[:tel]).to include("は数字で入力してください")
    end
    
    it "zip_codeがない場合は登録できないこと" do
      user = build(:user, zip_code: nil)
      user.valid?
      expect(user.errors[:zip_code]).to include()
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = build(:user, prefecture_id: nil)
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:user, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      user = build(:user, address: nil)
      user.valid?
      expect(user.errors[:address]).to include("を入力してください")
    end

    it "nicknameが13文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は12文字以内で入力してください")
    end

    it "nicknameが12文字以下では登録できること " do
      user = build(:user, nickname: "aaaaaaaaaaaa")
      expect(user).to be_valid
    end
    
    it "emailのフォーマットが不適切でないか" do
      user = build(:user, email: '12345678')
      user.valid?
      expect(user.errors[:email]).to include("は不適切です")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "a000000", password_confirmation: "a000000")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "q00000", password_confirmation: "q00000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it " passwordが英数字が含まれていない時は登録できないこと " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は半角英数字で入力してください")
    end

  end
end