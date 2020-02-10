RSpec.describe PageController do
  describe 'GET home' do
    it 'renders the home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe 'GET catalog' do
    it 'renders the catalog template' do
      get :catalog
      expect(response).to render_template(:catalog)
    end
  end
end
