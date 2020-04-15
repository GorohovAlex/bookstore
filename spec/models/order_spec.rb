RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_one(:shipping_address).dependent(:destroy) }
  it { is_expected.to have_one(:billing_address).dependent(:destroy) }
  it { is_expected.to have_one(:order_delivery).dependent(:destroy) }
  it { is_expected.to have_one(:order_card).dependent(:destroy) }
  it { is_expected.to have_many(:order_items).dependent(:destroy) }
  it { is_expected.to have_many(:order_summary).dependent(:destroy) }
end
