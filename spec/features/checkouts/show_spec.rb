describe 'Checkout page', type: :feature do
  let(:checkout) { CheckoutPage.new }
  let(:current_user) { create(:user, :with_cart_items) }
  let(:address) { build(:address) }
  let(:address_forms) { [checkout.billing_address_form, checkout.shipping_address_form] }

  describe 'With authorizated user' do
    before do
      login_as(current_user, scope: :user)
      visit checkout_path
    end

    describe 'Visit to checkout' do
      it 'Show block `steps`' do
        expect(checkout).to have_steps
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.address'))
      end

      it 'Show address forms' do
        expect(address_forms).to all(have_first_name)
        expect(address_forms).to all(have_last_name)
        expect(address_forms).to all(have_address)
        expect(address_forms).to all(have_city)
        expect(address_forms).to all(have_zip)
        expect(address_forms).to all(have_country)
        expect(address_forms).to all(have_phone)
      end

      it 'Show checkbox `use billing address`' do
        expect(checkout).to have_use_billing_address
      end

      it 'Show block `order summary`' do
        expect(checkout).to have_order_summary
      end

      it 'Show button `save`' do
        expect(checkout).to have_save_button
      end
    end

    describe 'Enter valid values' do
      before do
        address_forms.each do |form|
          form.first_name.input.set address.first_name
          form.last_name.input.set address.last_name
          form.address.input.set address.address
          form.city.input.set address.city
          form.zip.input.set address.zip
          form.country.select.find("option[value='#{address.country}']").select_option
          form.phone.input.set address.phone
        end
      end

      it 'Send form with valid values' do
        checkout.save_button.click
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.delivery'))
      end
    end
  end
end
