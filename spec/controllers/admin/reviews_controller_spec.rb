RSpec.describe Admin::ReviewsController, type: :controller do
  render_views

  let(:current_user) { create(:admin_user) }
  let!(:review) { create(:review) }

  before { sign_in current_user }

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns the category' do
      get :index
      expect(assigns(:reviews)).to include(review)
    end
  end

  describe 'GET show' do
    before do
      get :show, params: { id: review.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the review' do
      expect(assigns(:review)).to eq(review)
    end
  end
end
