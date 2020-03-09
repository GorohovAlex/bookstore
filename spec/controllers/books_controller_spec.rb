RSpec.describe BooksController do
  let(:book) { create :book, :with_authors }

  before { get :show, params: { id: book } }

  describe 'GET books#show' do
    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
