describe 'Home page', type: :feature do
  before do
    create_list(:book, 10, :two_authors)
  end

  it 'Visitor registers successfull' do
    visit root_path
    expect(page).to have_content 'Bookstore'
    expect(page).to have_css('.slide .carousel-inner .item')
  end
end
