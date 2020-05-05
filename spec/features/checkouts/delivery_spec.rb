describe 'Checkout page (delivery)', type: :feature do
  let(:checkout) { CheckoutDeliveryPage.new }
  let!(:delivery) { create_list :delivery, rand(2..6) }
  let(:order) { create_list :order, 1, :with_state_delivery }
  let(:current_user) { create(:user, :with_cart_items, orders: order) }

  describe 'With authorizated user' do
    before do
      login_as(current_user, scope: :user)
      visit checkout_path
    end

    describe 'Visit to page' do
      it 'Show block `steps`' do
        expect(checkout).to have_steps
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.delivery'))
      end

      it 'Show table `delivery`' do
        expect(checkout).to have_delivery_items
        expect(checkout.delivery_items).to all(have_name)
        expect(checkout.delivery_items).to all(have_days)
        expect(checkout.delivery_items).to all(have_price)
      end

      it 'Show block `order summary`' do
        expect(checkout).to have_order_summary
      end

      it 'Show button `save`' do
        expect(checkout).to have_button
      end
    end

    describe 'Not selecting nodes' do
      it 'Send form' do
        checkout.button.click
        expect(checkout).to have_alert
      end
    end

    describe 'Select delivery' do
      it 'Send form with valid values' do
        checkout.delivery_items.first.name.click
        checkout.button.click
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.payment'))
      end
    end
  end
end
