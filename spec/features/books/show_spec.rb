describe 'Book page', type: :feature do
  let(:book) { create(:book, :with_authors) }

  it 'Show book' do
    visit book_path(book)
    expect(page).to have_content book.name
    expect(page).to have_content book.decorate.authors_show
    expect(page).to have_content book.decorate.price_show
    expect(page).to have_content book.year_of_publication
    expect(page).to have_content book.decorate.materials_show
  end
end
