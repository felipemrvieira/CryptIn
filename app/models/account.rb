class Account < ApplicationRecord
  belongs_to :user
  has_many :transitions, dependent: :destroy
  has_many :wallets, dependent: :destroy
end
