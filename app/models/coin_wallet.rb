class CoinWallet < ApplicationRecord
  belongs_to :coin
  belongs_to :wallet
end
