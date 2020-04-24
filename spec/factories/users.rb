FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"a0000000"}
    password_confirmation {"a0000000"}
    last_name             {"大田"}
    first_name            {"太郎"}
    last_jp_name          {"オオタ"}
    first_jp_name         {"タロウ"}
    year_id               {1}
    month_id              {1}
    day_id                {1}
    tel                   {"09000000000"}
    zip_code              {"000-0000"}
    prefecture_id         {1}
    city                  {"札幌"}
    addresss              {"北区"}
  end

end