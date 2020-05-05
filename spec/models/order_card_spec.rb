RSpec.describe OrderCard, type: :model do
  it { is_expected.to belong_to(:order) }
end
