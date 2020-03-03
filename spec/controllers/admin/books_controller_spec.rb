RSpec.describe Admin::BooksController, type: :controller do
  render_views

  let(:page) { Capybara::Node::Simple.new(response.body) }
  let(:current_user) { create(:admin_user) }
  let!(:book) { create(:book) }
  let(:valid_attributes) { book.attributes }
  let(:invalid_attributes) { Book.new.attributes }

  before { sign_in current_user }

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns the book' do
      get :index
      expect(assigns(:books)).to include(book)
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns the book' do
      get :new
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new Book' do
        expect do
          post :create, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)
      end

      it 'assigns a newly created book as @book' do
        post :create, params: { book: valid_attributes }
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it 'redirects to the created book' do
        post :create, params: { book: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_book_path(Book.last))
      end
    end

    context 'with invalid params' do
      it 'invalid_attributes return http success' do
        post :create, params: { book: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      it 'assigns a newly created but unsaved book as @book' do
        post :create, params: { book: invalid_attributes }
        expect(assigns(:book)).to be_a_new(Book)
      end

      it 'invalid_attributes do not create a Book' do
        expect do
          post :create, params: { book: invalid_attributes }
        end.not_to change(Book, :count)
      end
    end
  end

  describe 'GET edit' do
    before do
      get :edit, params: { id: book.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the book' do
      expect(assigns(:book)).to eq(book)
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      before do
        put :update, params: { id: book.id, book: valid_attributes }
      end

      it 'assigns the book' do
        expect(assigns(:book)).to eq(book)
      end

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_book_path(book))
      end
    end

    context 'with invalid params' do
      it 'returns http success' do
        put :update, params: { id: book.id, book: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      # rubocop:disable Lint/AmbiguousBlockAssociation
      it 'does not change book' do
        expect do
          put :update, params: { id: book.id, book: invalid_attributes }
        end.not_to change { book.reload.name }
      end
      # rubocop:enable Lint/AmbiguousBlockAssociation
    end
  end

  describe 'GET show' do
    before do
      get :show, params: { id: book.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the book' do
      expect(assigns(:book)).to eq(book)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested select_option' do
      expect do
        delete :destroy, params: { id: book.id }
      end.to change(Book, :count).by(-1)
    end

    it 'redirects to the field' do
      delete :destroy, params: { id: book.id }
      expect(response).to redirect_to(admin_books_path)
    end
  end
end
