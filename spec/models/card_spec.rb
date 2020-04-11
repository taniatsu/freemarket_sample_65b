require 'rails_helper'

# RSpec.describe Card, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe Card do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      card = Card.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      card.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end