module Users
  RSpec.describe BillingAddressController do
    let(:current_user) { create(:user) }
    let(:billing_address) { build(:address) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in current_user
    end

    describe 'POST #billing_address' do
      it 'send invalid values' do
        post :update, params: { users_billing_address_form: { first_name: '', last_name: '', address: '',
                                                              city: '', zip: '', country: '', phone: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'send valid values' do
        billing_address.user_id = current_user.id
        post :update, params: { users_billing_address_form: billing_address.attributes }
        expect(response).to redirect_to(user_path)
      end
    end
  end
end
