require 'rails_helper'

RSpec.describe Book, type: :request do
  describe 'GET /show' do
    let(:book) { create :book, :with_authors }

    it 'returns http success' do
      get book_path(book)
      expect(response).to have_http_status(:success)
    end
  end
end
