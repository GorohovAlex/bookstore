describe 'Checkout page (delivery)', type: :feature do
  let(:checkout) { CheckoutAddressPage.new }
  let(:current_user) { create(:user, :with_cart_items, :with_order_delivery) }

  describe 'With authorizated user' do
    before do
      login_as(current_user, scope: :user)
      current_user.orders.last.to_delivery!
      visit checkout_path
    end

    describe 'Visit to checkout' do
      it 'Show block `steps`' do
        expect(checkout).to have_steps
        expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.delivery'))
      end

      it 'Show block `order summary`' do
        expect(checkout).to have_order_summary
      end

      it 'Show button `save`' do
        expect(checkout).to have_button
      end
    end

    # describe 'Enter invalid/empty values' do
    #   it 'Send form' do
    #     checkout.button.click
    #     address_forms.each do |form|
    #       expect(form.first_name).to have_error
    #       expect(form.last_name).to have_error
    #       expect(form.address).to have_error
    #       expect(form.city).to have_error
    #       expect(form.zip).to have_error
    #       expect(form.country).to have_error
    #       expect(form.phone).to have_error
    #     end
    #   end
    # end

    # describe 'Enter valid values' do
    #   before do
    #     address_forms.each do |form|
    #       form.first_name.input.set address.first_name
    #       form.last_name.input.set address.last_name
    #       form.address.input.set address.address
    #       form.city.input.set address.city
    #       form.zip.input.set address.zip
    #       form.country.select.find("option[value='#{address.country}']").select_option
    #       form.phone.input.set address.phone
    #     end
    #   end

    #   it 'Send form with valid values' do
    #     checkout.button.click
    #     expect(checkout.steps.step_active.step_text.text).to eq(I18n.t('checkouts.step.delivery'))
    #   end
    # end
  end
end
