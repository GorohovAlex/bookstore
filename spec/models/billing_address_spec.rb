RSpec.describe BillingAddress, type: :model do
  context 'with associations' do
    it { is_expected.to belong_to(:user).class_name(User) }
  end
end
