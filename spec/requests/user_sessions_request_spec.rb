require 'spec_helper'

RSpec.describe User, type: :request do
  describe 'GET auth/facebook/callback' do
    before do
      valid_facebook_login_setup
      get '/users/auth/facebook/callback'
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
    end

    it 'sets user_id' do
      expect(session['warden.user.user.key'].flatten.first).to eq(described_class.last.id)
    end

    it 'redirects to root' do
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET auth/facebook/callback' do
    before do
      valid_facebook_login_setup
      get '/users/auth/facebook/callback'
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
    end

    it 'sets user_id' do
      expect(session['warden.user.user.key'].flatten.first).to eq(described_class.last.id)
    end

    it 'redirects to root' do
      expect(response).to redirect_to root_path
    end
  end
end
