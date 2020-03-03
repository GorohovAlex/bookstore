RSpec.describe Admin::AuthorsController, type: :controller do
  render_views

  let(:page) { Capybara::Node::Simple.new(response.body) }
  let(:current_user) { create(:admin_user) }
  let!(:author) { create(:author) }
  let(:valid_attributes) { author.attributes }
  let(:invalid_attributes) { Author.new.attributes }

  before { sign_in current_user }

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns the author' do
      get :index
      expect(assigns(:authors)).to include(author)
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns the author' do
      get :new
      expect(assigns(:author)).to be_a_new(Author)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new author' do
        expect do
          post :create, params: { author: valid_attributes }
        end.to change(Author, :count).by(1)
      end

      it 'assigns a newly created author as @author' do
        post :create, params: { author: valid_attributes }
        expect(assigns(:author)).to be_a(Author)
        expect(assigns(:author)).to be_persisted
      end

      it 'redirects to the created author' do
        post :create, params: { author: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_author_path(Author.last))
      end
    end

    context 'with invalid params' do
      it 'invalid_attributes return http success' do
        post :create, params: { author: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      it 'assigns a newly created but unsaved author as @author' do
        post :create, params: { author: invalid_attributes }
        expect(assigns(:author)).to be_a_new(Author)
      end

      it 'invalid_attributes do not create a Author' do
        expect do
          post :create, params: { author: invalid_attributes }
        end.not_to change(Author, :count)
      end
    end
  end

  describe 'GET edit' do
    before do
      get :edit, params: { id: author.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the author' do
      expect(assigns(:author)).to eq(author)
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      before do
        put :update, params: { id: author.id, author: valid_attributes }
      end

      it 'assigns the author' do
        expect(assigns(:author)).to eq(author)
      end

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_author_path(author))
      end
    end

    context 'with invalid params' do
      it 'returns http success' do
        put :update, params: { id: author.id, author: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      # rubocop:disable Lint/AmbiguousBlockAssociation
      it 'does not change author' do
        expect do
          put :update, params: { id: author.id, author: invalid_attributes }
        end.not_to change { author.reload.first_name }
      end
      # rubocop:enable Lint/AmbiguousBlockAssociation
    end
  end

  describe 'GET show' do
    before do
      get :show, params: { id: author.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the author' do
      expect(assigns(:author)).to eq(author)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested select_option' do
      expect do
        delete :destroy, params: { id: author.id }
      end.to change(Author, :count).by(-1)
    end

    it 'redirects to the field' do
      delete :destroy, params: { id: author.id }
      expect(response).to redirect_to(admin_authors_path)
    end
  end
end
