FactoryBot.define do
  factory :item do
    category_id                {1}
    name                      {"test"} 
    explanation              {"testtest0010"}
    price                    {1000}
    size                     {2}
    fee_which                {1}
    from_where               {"北海道"}
    delivery_date            {1}
  end
end