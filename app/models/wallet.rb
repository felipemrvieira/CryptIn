class Wallet < ApplicationRecord
  belongs_to :account
  has_many :coin_wallets, dependent: :destroy
  has_many :coins, :through => :coin_wallets
  has_many :wallet_origins,        class_name: 'Operation',   foreign_key: 'wallet_origin_id',        dependent: :destroy
  has_many :wallet_destinations,   class_name: 'Operation',   foreign_key: 'wallet_destination_id',   dependent: :destroy
end
