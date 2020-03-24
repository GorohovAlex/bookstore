describe 'Book page', type: :feature do
  let(:current_user) { create(:user) }
  let(:book) { create(:book, :with_authors, :with_reviews) }
  let(:book_page) { BookPage.new }
  let(:review) { build(:review) }

  before do
    login_as(current_user, scope: :user)
    book_page.load(id: book.id)
  end

  it 'Show book content' do
    expect(book_page).to have_content book.name
    expect(book_page).to have_content book.decorate.authors_show
    expect(book_page).to have_content book.decorate.price_show
    expect(book_page).to have_content book.year_of_publication
    expect(book_page).to have_content book.decorate.materials_show
  end

  it 'Have book elements on page' do
    expect(book_page).to have_name
    expect(book_page).to have_authors
    expect(book_page).to have_price
    expect(book_page).to have_year_of_publication
    expect(book_page).to have_materials
  end

  it 'Have review elements on page' do
    expect(book_page).to have_review_form
    expect(book_page).to have_reviews
  end

  it 'Show reviews' do
    expect(book_page.reviews).to have_reviews_count
    expect(book_page.reviews).to have_review_list(count: book.reviews.filter(&:approved?).count)
  end

  describe 'Show review form' do
    it 'valid data' do
      book_page.review_form.rating[rand(Review::RATING_INTERVAL).pred].click
      book_page.review_form.title.input.set review.title
      book_page.review_form.review.input.set review.review
      book_page.review_form.submit.click
      expect(book_page).to have_notice
    end

    it 'invalid data' do
      book_page.review_form.submit.click
      expect(book_page.review_form.title).to have_error
      expect(book_page.review_form.review).to have_error
    end
  end
end
