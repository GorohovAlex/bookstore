describe 'Log in page', type: :feature do
  it 'Show form `Log in`' do
    visit new_user_session_path
    expect(page).to have_css('.fa-facebook-official')
    expect(page).to have_css('#user_email')
    expect(page).to have_css('#user_password')
    expect(page).to have_css('button#log_in')
    expect(page).to have_css('#sign_up')
  end
end
