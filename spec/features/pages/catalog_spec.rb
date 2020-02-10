describe 'Catalog page', type: :feature do
  before do
    create_list(:book, Constants::PAGY_COUNT_DEFAULT * 2, :with_authors)
  end

  it 'Show books' do
    visit catalog_path
    expect(page).to have_selector('.general-thumb-wrap', count: Constants::PAGY_COUNT_DEFAULT)
    expect(page).to have_selector('#next_link')
    find('#next_link').click
    expect(page).to have_selector('.general-thumb-wrap', count: Constants::PAGY_COUNT_DEFAULT * 2)
  end
end
