describe 'Checkout page (payment)', type: :feature do
  let(:order) { create :order, :with_state_payment }
  let(:checkout) { CheckoutPaymentPage.new }
  let(:order_card) { build(:order_card) }
  let!(:deliveries) { create_list :delivery, rand(2..6) }
  let(:current_user) { create(:user, :with_cart_items, orders: [order]) }
  let!(:order_delivery) { create :order_delivery, order: order, delivery: deliveries.first }
  let!(:order_billing_address) { create(:address, :billing_type, owner: order) }
  let!(:order_shipping_address) { create(:address, :shipping_type, owner: order) }

  describe 'With authorizated user' do
    before do
      login_as(current_user, scope: :user)
      visit checkout_path
    end

    describe 'Visit to page' do
      it 'Show block `steps`' do
        expect(checkout).to have_steps
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.payment'))
      end

      it 'Show form `cards`' do
        expect(checkout).to have_card_form
        expect(checkout.card_form).to have_card_number
        expect(checkout.card_form).to have_card_name
        expect(checkout.card_form).to have_date_expiry
        expect(checkout.card_form).to have_card_cvv
      end

      it 'Show block `order summary`' do
        expect(checkout).to have_order_summary
      end

      it 'Show button `save`' do
        expect(checkout).to have_button
      end
    end

    describe 'Enter invalid/empty values' do
      it 'Send form' do
        checkout.button.click
        expect(checkout.card_form.card_number).to have_error
        expect(checkout.card_form.card_name).to have_error
        expect(checkout.card_form.date_expiry).to have_error
        expect(checkout.card_form.card_cvv).to have_error
      end
    end

    describe 'Enter valid values' do
      before do
        checkout.card_form.card_number.input.set order_card.number
        checkout.card_form.card_name.input.set order_card.name
        checkout.card_form.date_expiry.input.set order_card.date_expiry
        checkout.card_form.card_cvv.input.set order_card.cvv
      end

      it 'Send form with valid values' do
        checkout.button.click_link
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.confirm'))
      end
    end
  end
end
