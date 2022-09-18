FactoryBot.define do
  factory :operation do
    amount { 1.0 }
    kind { 1 }
    association :wallet_origin, factory: :wallet
    association :wallet_destination, factory: :wallet
    coin
  end
end
