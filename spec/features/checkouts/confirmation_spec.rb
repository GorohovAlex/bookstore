describe 'Checkout page (confirm)', type: :feature do
  let(:order) { create :order, :with_state_confirmation }
  let(:checkout) { CheckoutConfirmationPage.new }
  let(:order_card) { build(:order_card) }
  let!(:deliveries) { create_list :delivery, rand(2..6) }
  let(:current_user) { create(:user, :with_cart_items, orders: [order]) }
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
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.confirmation'))
      end

      it 'Show info boxes' do
        expect(checkout.confirm_info_box.count).to eq(4)
        expect(checkout.confirm_info_box).to all(have_edit)
        expect(checkout.confirm_info_box).to all(have_subtitle)
        expect(checkout.confirm_info_box).to all(have_description)
      end

      it 'Show cart items' do
        expect(checkout.cart_line_items.count).to eq(current_user.cart_item.count)
      end

      it 'Show block `order summary`' do
        expect(checkout).to have_order_summary
      end

      it 'Show button `save`' do
        expect(checkout).to have_button
      end
    end

    it 'Place order' do
      checkout.button.click
      expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.completed'))
    end
  end
end
