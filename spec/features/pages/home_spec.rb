describe 'Home page' do
  let(:user) { create(:user) }

  before do
    create_list(:book, 10, :with_authors)
  end

  it 'Guest user visit' do
    visit root_path
    expect(page).to have_content I18n.t('site_name')
    expect(page).to have_content I18n.t('partials.header.my_account')
    expect(page).to have_css('.slide .carousel-inner .item')
  end
end
