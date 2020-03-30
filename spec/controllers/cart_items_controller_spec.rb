RSpec.describe CartItemsController do
  let(:cart_item_new) { build(:cart_item) }
  let(:cart_item) { create(:cart_item, session_id: session.id) }

  before do
    cart_item_new.session_id = session.id
    cart_item.session_id = session.id
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns a 200 OK status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'when success create CartItem' do
      it 'returns a 200 OK status' do
        post :create, format: 'js', params: { cart_item: cart_item_new.attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when failes create CartItem' do
      it 'returns a 302 Redirect status' do
        post :create, format: 'js', params: { cart_item: nil }
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when input correct value' do
      it 'returns a 302 status' do
        patch :update, format: 'js', params: { id: cart_item.id, cart_item: cart_item.attributes }
        expect(response).to have_http_status(:found)
      end
    end

    context 'when input empty value' do
      it 'returns a 302 status' do
        patch :update, format: 'js', params: { id: cart_item.id, cart_item: nil }
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when input correct value' do
      it 'returns a 302 status' do
        delete :destroy, format: 'js', params: { id: cart_item.id }
        expect(response).to have_http_status(:found)
      end
    end

    # context 'when input empty value' do
    #   it 'returns a 302 status' do
    #     delete :destroy, format: 'js', params: { id: nil }
    #     expect(response).to have_http_status(:ok)
    #   end
    # end
  end
end
