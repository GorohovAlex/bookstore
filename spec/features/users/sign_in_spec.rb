describe 'Log in page' do
  let(:sign_in) { SignIn.new }
  let(:home_page) { HomePage.new }
  let(:user) { create(:user) }

  before { sign_in.load }

  it 'Show form `Log in`' do
    expect(sign_in).to have_facebook_icon
    expect(sign_in).to have_email_input
    expect(sign_in).to have_password_input
    expect(sign_in).to have_log_in_button
    expect(sign_in).to have_sign_up_link
  end

  describe 'Click to Log in button' do
    it 'Empty email and password' do
      sign_in.log_in_button.click
      expect(sign_in.alert_message.visible?).to eq(true)
    end

    it 'Valide email and password' do
      sign_in.email_input.set user.email
      sign_in.password_input.set user.password
      sign_in.log_in_button.click
      expect(home_page).to have_user_email
      expect(home_page.user_email.text).to eq(user.email)
    end
  end
end
