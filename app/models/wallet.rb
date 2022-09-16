class Wallet < ApplicationRecord
  belongs_to :account
  has_many :coin_wallets
  has_many :coin, :through => :coin_wallets
  has_many :wallet_origins,        class_name: 'Operation',   foreign_key: 'wallet_origin_id'
  has_many :wallet_destinations,   class_name: 'Operation',   foreign_key: 'wallet_destination_id'
end
