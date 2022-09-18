class Coin < ApplicationRecord
    has_many :coin_wallets
    has_many :wallets, :through => :coin_wallets
    validates :name, presence: true
    validates :acronym, presence: true
end
