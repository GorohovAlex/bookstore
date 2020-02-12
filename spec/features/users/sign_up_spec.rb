describe 'Log in page' do
  let(:sign_up) { SignUp.new }
  let(:home_page) { HomePage.new }
  let(:user) { build(:user) }

  before { sign_up.load }

  it 'Show form `Sign up`' do
    expect(sign_up).to have_facebook_icon
    expect(sign_up).to have_email_input
    expect(sign_up).to have_password_input
    expect(sign_up).to have_password_confirm_input
    expect(sign_up).to have_sign_up_button
  end

  describe 'Click to Sign up button' do
    it 'Empty email and password' do
      sign_up.sign_up_button.click
      expect(sign_up.email_invalid_feedback.visible?).to eq(true)
    end

    it 'Valide email and password' do
      sign_up.email_input.set user.email
      sign_up.password_input.set user.password
      sign_up.password_confirm_input.set user.password
      sign_up.sign_up_button.click
      expect(home_page).to have_user_email
      expect(home_page.user_email.text).to eq(user.email)
    end
  end
end
