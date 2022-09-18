FactoryBot.define do
  factory :coin_wallet do
    coin
    balance { 1000.0 }
    wallet
  end
end
