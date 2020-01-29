describe 'Home page', type: :feature do
  before do
    # author = Author.create(first_name: 'FirstName', last_name: 'LastName')
    # category = Category.create(name: 'Web')
    # Book.create(name: 'My Book', authors: [author], description: 'text', category: category)
    create_list :book, 10
  end

  it 'Visitor registers successfull' do
    visit root_path
    expect(page).to have_content 'Bookstore'
    expect(page).to have_css('.slide .carousel-inner .item')
  end
end
