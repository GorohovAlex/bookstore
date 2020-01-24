describe 'Home page' do
  it 'Visitor registers successfull' do
    visit root_path
    expect(page).to have_content 'Bookstore'
    expect(page).to have_css('.slide .carousel-inner .item')
  end
end
