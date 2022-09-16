class Account < ApplicationRecord
  belongs_to :user
  has_many :transitions
  has_many :wallets
end
