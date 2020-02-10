RSpec.describe PageController do
  describe 'GET home' do
    it 'renders the home template' do
      get :home
      expect(response).to render_template(:home)
    end

    it 'log in user ' do
      user = FactoryBot.create(:user)
      sign_in user
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET catalog' do
    it 'renders the catalog template' do
      get :catalog
      expect(response).to render_template(:catalog)
    end

    it 'renders the catalog template with sorting' do
      get :catalog, params: { sort: 'newest_first' }
      expect(response).to render_template(:catalog)
    end
  end
end
