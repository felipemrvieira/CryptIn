require 'rails_helper'

RSpec.describe Operation, type: :model do
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:kind) }

  it { is_expected.to belong_to(:coin) }
  it { is_expected.to belong_to(:wallet_origin) }
  it { is_expected.to belong_to(:wallet_destination) }
end
