require 'rails_helper'

RSpec.describe CoinWallet, type: :model do
  it { is_expected.to belong_to(:coin) }
  it { is_expected.to belong_to(:wallet) }
end
