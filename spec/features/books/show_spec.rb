describe 'Book page', type: :feature do
  let(:current_user) { create(:user) }
  let(:book) { create(:book, :with_authors, :with_reviews) }
  let(:page) { BookPage.new }
  let(:review) { build(:review) }

  before do
    login_as(current_user, scope: :user)
    page.load(id: book.id)
  end

  it 'Show book content' do
    expect(page).to have_content book.name
    expect(page).to have_content book.decorate.authors_show
    expect(page).to have_content book.decorate.price_show
    expect(page).to have_content book.year_of_publication
    expect(page).to have_content book.decorate.materials_show
  end

  it 'Have book elements on page' do
    expect(page).to have_name
    expect(page).to have_authors
    expect(page).to have_price
    expect(page).to have_year_of_publication
    expect(page).to have_materials
  end

  it 'Have review elements on page' do
    expect(page).to have_review_form
    expect(page).to have_reviews
  end

  it 'Show reviews' do
    expect(page.reviews).to have_reviews_count
    expect(page.reviews).to have_review_list(count: book.reviews.filter(&:approved?).count)
  end

  describe 'Show review form' do
    it 'valid data' do
      page.review_form.rating[rand(Review::RATING_INTERVAL).pred].click
      page.review_form.title.input.set review.title
      page.review_form.review.input.set review.review
      page.review_form.submit.click
      sleep(10)
      expect(page).to have_notice
    end

    it 'invalid data' do
    end
  end
end
