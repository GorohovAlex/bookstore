describe 'Order page', type: :feature do
  let(:order_page) { OrderPage.new }
  let(:order) { create :order, :with_items, :with_state_completed }
  let(:order_card) { build(:order_card) }
  let!(:deliveries) { create_list :delivery, rand(2..6) }
  let(:current_user) { create(:user, orders: [order]) }
  let!(:order_delivery) { create :order_delivery, order: order, delivery: deliveries.first }
  let!(:order_billing_address) { create(:address, :billing_type, owner: order) }
  let!(:order_shipping_address) { create(:address, :shipping_type, owner: order) }
  let!(:payment) { create(:order_card, order: order) }

  describe 'With authorizated user' do
    before do
      login_as(current_user, scope: :user)
      visit user_order_path(order.id)
    end

    describe 'Visit to page' do
      it 'Show ordeers items' do
        expect(order_page.orders_items.count).to eq(order.order_items.count)
      end

      it 'Show block `order summary`' do
        expect(order_page).to have_order_summary
      end

      it 'Show block `order info box`' do
        expect(order_page).to have_info_box
      end
    end
  end
end
