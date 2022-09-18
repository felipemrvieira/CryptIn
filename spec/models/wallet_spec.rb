require 'rails_helper'

RSpec.describe Wallet, type: :model do
  it { is_expected.to belong_to(:account) }
end
