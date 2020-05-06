RSpec.describe OrdersController do
  let(:current_user) { create(:user) }
  let(:order) { create(:order, :with_items, user: current_user) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in current_user
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: order.id }
    end

    it 'renders the index template' do
      expect(response).to render_template(:show)
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
