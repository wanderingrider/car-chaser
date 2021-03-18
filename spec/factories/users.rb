FactoryBot.define do
  factory :user do
    nickname              { 'taro' }
    email                 { 'a@com' }
    password              { 'a12345' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    read_first_name       { 'ヤマダ' }
    read_last_name        { 'タロウ' }
  end
end
