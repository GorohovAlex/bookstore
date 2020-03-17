describe 'Book page', type: :feature do
  let(:current_user) { create(:user) }
  let(:book) { create(:book, :with_authors) }
  let(:book_page) { BookPage.new }

  before do
    login_as(current_user, scope: :user)
    visit book_path(book)
  end

  describe 'Click to plus quantity' do
    it 'increments the count by 1' do
      expect { book_page.counter.quantity_plus.click }.to change { book_page.counter.quantity_value.value.to_i }.by(1)
    end
  end

  describe 'Click to minus quantity' do
    it 'increments the quantity by 1' do
      book_page.counter.quantity_value.set '2'
      expect { book_page.counter.quantity_minus.click }.to change { book_page.counter.quantity_value.value.to_i }.by(-1)
    end

    it 'thes quantity eq 1' do
      book_page.counter.quantity_minus.click
      expect(book_page.counter.quantity_value.value.to_i).to eq(1)
    end
  end

  describe 'Click to Add to cart' do
    it 'shoult increment the quantity items cart icon' do
      expect { book_page.button_add_to_cart.click }.to change { book_page.cart_count_icon.text.to_i }.by(1)
    end
  end
end
