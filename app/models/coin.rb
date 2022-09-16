class Coin < ApplicationRecord
    has_many :coin_wallets
    has_many :wallets, :through => :coin_wallets
end
