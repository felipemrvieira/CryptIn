require 'rails_helper'

RSpec.describe CoinWallet, type: :model do
  it { is_expected.to belong_to(:coin) }
  it { is_expected.to belong_to(:wallet) }
  # it { is_expected.to validate_uniqueness_of(:coin_id).scoped_to(:wallet_id) }

end
