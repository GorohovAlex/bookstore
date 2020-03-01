module Devise
  RSpec.describe UserController do
    let(:current_user) { create(:user) }
    let(:password_new) { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }
    let(:billing_address) { build(:address) }
    let(:shipping_address) { build(:address) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in current_user
    end

    describe 'GET #index' do
      before do
        get :edit
      end

      it 'renders the index template' do
        expect(response).to render_template(:edit)
      end

      it 'returns a 200 OK status' do
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'POST #email' do
      it 'send invalid values' do
        post :update, params: { user: { email: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'send valid values' do
        post :update, params: { user: { email: FFaker::Internet.email } }
        expect(response).to redirect_to(user_path)
      end
    end

    describe 'POST #password' do
      it 'send invalid values' do
        post :update, params: { password_form: { old_password: '', password: '', password_confirmation: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'send valid values' do
        post :update, params: { password_form: { old_password: current_user.password,
                                                 password: password_new,
                                                 password_confirmation: password_new } }

        expect(response).to redirect_to(user_path)
      end
    end
  end
end
