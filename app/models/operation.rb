class Operation < ApplicationRecord
  belongs_to :coin
  belongs_to :wallet_origin, class_name: 'Wallet'
  belongs_to :wallet_destination, class_name: 'Wallet'
  validates :amount, presence: true
  validates :kind, presence: true
end
