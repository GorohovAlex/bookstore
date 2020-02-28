module Users
  RSpec.describe AddressController do
    let(:current_user) { create(:user) }
    let(:address) { build(:address) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in current_user
    end

    describe 'POST #address' do
      it 'send invalid values' do
        post :update, params: { first_name: '', last_name: '', address: '', city: '', zip: '', country: '', phone: '' }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'send valid values' do
        address.user_id = current_user.id
        post :update, params: address.attributes
        expect(response).to redirect_to(user_path)
      end
    end
  end
end
