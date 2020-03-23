describe 'CheckoutEmailLogin page', type: :feature do
  let(:checkout_email_login_page) { CheckoutEmailLoginPage.new }
  let(:user)                      { create(:user) }
  let(:new_user)                  { build(:user) }

  before { visit checkout_email_login_path }

  it 'Show page' do
    expect(checkout_email_login_page).to have_returning_customer_email
    expect(checkout_email_login_page).to have_returning_customer_password
    expect(checkout_email_login_page).to have_returning_customer_submit

    expect(checkout_email_login_page).to have_quick_registrate_email
    expect(checkout_email_login_page).to have_quick_registrate_submit
  end

  describe 'Authorizate user' do
    it 'Redirect to checkout' do
      checkout_email_login_page.returning_customer_email.input.set user.email
      checkout_email_login_page.returning_customer_password.input.set user.password
      checkout_email_login_page.returning_customer_submit.click
      expect(page).to have_current_path(checkout_path, ignore_query: true)
    end
  end

  describe 'Guest user' do
    it 'Redirect to checkout' do
      checkout_email_login_page.quick_registrate_email.input.set new_user.email
      checkout_email_login_page.quick_registrate_submit.click
      expect(page).to have_current_path(checkout_path, ignore_query: true)
    end
  end
end
