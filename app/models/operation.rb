class Operation < ApplicationRecord
  belongs_to :coin
  belongs_to :wallet_origin, class_name: 'Wallet'
  belongs_to :wallet_destination, class_name: 'Wallet'
  validates :amount, presence: true
  validates :kind, presence: true

  enum :kind, { buy: 0, sell: 1, transfer: 2 }

  validate :should_have_balance

  private
  def should_have_balance
    origin = Wallet.find(self.wallet_origin_id)
    destination = Wallet.find(self.wallet_destination_id)
    
    # Check if origin account has the coin
    if !origin.coin_wallets.where(coin_id: self.coin_id).any?
      errors.add(:wallet_origin_id, "This wallet does not have this coin")
    else
      origin_coin = origin.coin_wallets.where(coin_id: self.coin_id).first
      # Check if origin coin has the amount
      if origin_coin.balance < self.amount
        errors.add(:amount, "This wallet does not have this amount of this coin")
      end
    end

  end

end
