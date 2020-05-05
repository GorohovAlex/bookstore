RSpec.describe OrderDelivery, type: :model do
  it { is_expected.to belong_to(:order) }
  it { is_expected.to belong_to(:delivery) }
end
