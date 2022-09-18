FactoryBot.define do
  factory :coin_wallet do
    balance { 1000.0 }
    wallet
    coin
  end
end
