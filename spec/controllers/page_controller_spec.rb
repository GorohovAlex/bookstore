RSpec.describe PageController do
  describe 'GET #home' do
    it 'renders the home template' do
      get :home
      expect(response).to render_template(:home)
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET catalog' do
    it 'renders the catalog template' do
      get :catalog
      expect(response).to render_template(:catalog)
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
