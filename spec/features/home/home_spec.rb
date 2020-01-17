feature 'Home page' do
  scenario 'Visitor registers successfull' do
    visit root_path
    expect(page).to have_content 'Log out'
  end
end
