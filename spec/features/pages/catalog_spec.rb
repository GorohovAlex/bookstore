describe 'Catalog page', type: :feature do
  let(:current_user) { create(:user) }
  let(:catalog_page) { CatalogPage.new }

  let!(:_before) do
    login_as(current_user, scope: :user)
    create_list(:book, Constants::PAGY_COUNT_DEFAULT * 2, :with_authors)
    visit catalog_path
  end

  it 'Show catalog page' do
    expect(catalog_page).to have_books_items(count: Constants::PAGY_COUNT_DEFAULT)
    expect(catalog_page).to have_button_more
  end

  it 'Click button `More`' do
    catalog_page.button_more.click
    expect(catalog_page).to have_books_items(count: Constants::PAGY_COUNT_DEFAULT * 2)
  end

  it 'Click button `add to cart`' do
    random_button = rand(0...catalog_page.books_items.count)
    catalog_page.books_items[random_button].root_element.hover
    expect do
      catalog_page.books_items[random_button].add_to_cart.click
      sleep 1
    end .to change { catalog_page.cart_count_icon.text.to_i }.by(1)
  end
end
