require 'rails_helper'

RSpec.describe Coin, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:acronym) }
  it { is_expected.to validate_presence_of(:acronym) }

  it { is_expected.to have_many(:coin_wallets) }
  it { is_expected.to have_many(:wallets) }
end
