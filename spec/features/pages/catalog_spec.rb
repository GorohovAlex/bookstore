describe 'Catalog page', type: :feature do
  let(:catalog_page) { CatalogPage.new }
  let!(:books) { create_list(:book, Constants::PAGY_COUNT_DEFAULT * 2, :with_authors) }

  it 'Show books' do
    visit catalog_path
    expect(catalog_page.books).to eq(count: Constants::PAGY_COUNT_DEFAULT)
    expect(page).to have_selector('#next_link')
    find('#next_link').click
    expect(catalog_page.books).to eq(count: Constants::PAGY_COUNT_DEFAULT * 2)

    # expect(page).to have_selector('.general-thumb-wrap', count: Constants::PAGY_COUNT_DEFAULT * 2)
  end
end
