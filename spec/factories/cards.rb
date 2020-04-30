FactoryBot.define do
  factory :card do
    user_id                {1}
    customer_id             {"2"} #文字列にする必要がある
    card_id              {"testtest0010"}
  end
end
