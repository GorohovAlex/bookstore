RSpec.describe ReviewsController do
  let(:current_user) { create(:user) }
  let(:book) { create(:book) }
  let(:review) { build(:review) }
  let(:review_empty) { build(:review, :empty) }

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in current_user
  end

  describe 'POST #create' do
    it 'send invalid values' do
      post :create, params: { review_form: review_empty.attributes, book_id: book.id }, format: 'js'
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'send valid values' do
      review.user_id = current_user.id
      review.book = book
      post :create, params: { review_form: review.attributes, book_id: book.id }
      expect(response).to redirect_to book_path(book.id)
    end
  end
end
