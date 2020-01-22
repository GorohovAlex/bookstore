describe PageController do
  describe 'GET home' do
    it 'renders home template' do
      get :home
      expect(response).to render_template :home
    end
  end
end
