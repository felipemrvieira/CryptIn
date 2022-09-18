class CoinWallet < ApplicationRecord
  belongs_to :coin
  belongs_to :wallet
  validates_uniqueness_of :coin_id, scope: :wallet_id
end
