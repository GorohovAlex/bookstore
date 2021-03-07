describe 'Checkout page (confirm)', type: :feature do
  let(:order) { create :order, :with_items, :with_state_completed }
  let(:checkout) { CheckoutCompletedPage.new }
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
      visit checkout_path
    end

    describe 'Visit to page' do
      it 'Show block `steps`' do
        expect(checkout).to have_steps
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.completed'))
      end

      it 'Show cart items' do
        expect(checkout.cart_line_items.count).to eq(order.order_items.count)
      end

      it 'Show block `order summary`' do
        expect(checkout).to have_order_summary
      end

      it 'Show block `order info`' do
        expect(checkout).to have_order_info
      end

      it 'Show button `Back to Store`' do
        expect(checkout).to have_button
      end
    end
  end
end
