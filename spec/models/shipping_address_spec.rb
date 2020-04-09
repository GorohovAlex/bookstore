RSpec.describe ShippingAddress, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:owner) }
  end
end
