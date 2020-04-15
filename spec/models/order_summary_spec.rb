RSpec.describe OrderSummary, type: :model do
  it { is_expected.to belong_to(:order) }
end
