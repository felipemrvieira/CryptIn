require 'rails_helper'

RSpec.describe Transition, type: :model do
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to belong_to(:account) }
end
