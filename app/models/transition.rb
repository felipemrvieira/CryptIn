class Transition < ApplicationRecord
  belongs_to :account
  validates :amount, presence: true
end
