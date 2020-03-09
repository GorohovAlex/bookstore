RSpec.describe Admin::CategoriesController, type: :controller do
  render_views

  let(:page) { Capybara::Node::Simple.new(response.body) }
  let(:current_user) { create(:admin_user) }
  let!(:category) { create(:category) }
  let(:valid_attributes) { category.attributes }
  let(:invalid_attributes) { Category.new.attributes }

  before { sign_in current_user }

  describe 'GET index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns the category' do
      get :index
      expect(assigns(:categories)).to include(category)
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns the category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new category' do
        expect do
          post :create, params: { category: valid_attributes }
        end.to change(Category, :count).by(1)
      end

      it 'assigns a newly created category as @category' do
        post :create, params: { category: valid_attributes }
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
      end

      it 'redirects to the created category' do
        post :create, params: { category: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_category_path(Category.last))
      end
    end

    context 'with invalid params' do
      it 'invalid_attributes return http success' do
        post :create, params: { category: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      it 'assigns a newly created but unsaved category as @category' do
        post :create, params: { category: invalid_attributes }
        expect(assigns(:category)).to be_a_new(Category)
      end

      it 'invalid_attributes do not create a Category' do
        expect do
          post :create, params: { category: invalid_attributes }
        end.not_to change(Category, :count)
      end
    end
  end

  describe 'GET edit' do
    before do
      get :edit, params: { id: category.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the category' do
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      before do
        put :update, params: { id: category.id, category: valid_attributes }
      end

      it 'assigns the category' do
        expect(assigns(:category)).to eq(category)
      end

      it 'returns http redirect' do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_category_path(category))
      end
    end

    context 'with invalid params' do
      it 'returns http success' do
        put :update, params: { id: category.id, category: invalid_attributes }
        expect(response).to have_http_status(:success)
      end

      # rubocop:disable Lint/AmbiguousBlockAssociation
      it 'does not change category' do
        expect do
          put :update, params: { id: category.id, category: invalid_attributes }
        end.not_to change { category.reload.name }
      end
      # rubocop:enable Lint/AmbiguousBlockAssociation
    end
  end

  describe 'GET show' do
    before do
      get :show, params: { id: category.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the category' do
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested select_option' do
      expect do
        delete :destroy, params: { id: category.id }
      end.to change(Category, :count).by(-1)
    end

    it 'redirects to the field' do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(admin_categories_path)
    end
  end
end
