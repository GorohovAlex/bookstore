RSpec.describe AddressService do
  context 'service address' do
    let(:current_order) { create(:order) }
    let(:new_order_data) { build(:order) }
    let(:address_service) { AddressService.new(current_order: current_order, params: params) }
    let(:params) { { coupon: nil, order: new_order_data.attributes } }

    it 'update billing and shipping addresses' do
      except(address_service.call).to be(false)
    end
  end
end
