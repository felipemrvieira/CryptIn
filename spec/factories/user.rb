FactoryBot.define do
    factory :user do
        name { FFaker::NameBR.name }
        email { FFaker::Internet.email }
        password { '123123' }
        password_confirmation { '123123' }
    end
end