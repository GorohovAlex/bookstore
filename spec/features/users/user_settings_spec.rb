describe 'User (Settings) page' do
  let(:current_user) { create(:user) }
  let(:user_settings) { UserSettings.new }

  before do
    login_as(current_user, scope: :user)
    user_settings.load
  end

  it 'Show form `BillingForm`' do
    expect(user_settings).to have_billing_address_form
    expect(user_settings.billing_address_form).to have_first_name
    expect(user_settings.billing_address_form).to have_last_name
    expect(user_settings.billing_address_form).to have_address
    expect(user_settings.billing_address_form).to have_city
    expect(user_settings.billing_address_form).to have_zip
    expect(user_settings.billing_address_form).to have_country
    expect(user_settings.billing_address_form).to have_phone
    expect(user_settings.billing_address_form).to have_submit
  end

  it 'Show form `ShippingForm`' do
    expect(user_settings).to have_shipping_address_form
    expect(user_settings.shipping_address_form).to have_first_name
    expect(user_settings.shipping_address_form).to have_last_name
    expect(user_settings.shipping_address_form).to have_address
    expect(user_settings.shipping_address_form).to have_city
    expect(user_settings.shipping_address_form).to have_zip
    expect(user_settings.shipping_address_form).to have_country
    expect(user_settings.shipping_address_form).to have_phone
    expect(user_settings.shipping_address_form).to have_submit
  end

  it 'Show form `EmailForm`' do
    user_settings.privacy_tab_link.click
    expect(user_settings).to have_email_form
    expect(user_settings.email_form).to have_email
    expect(user_settings.email_form).to have_submit
  end

  it 'Show form `PasswordForm`' do
    user_settings.privacy_tab_link.click
    expect(user_settings).to have_passwords_form
    expect(user_settings.passwords_form).to have_password_old
    expect(user_settings.passwords_form).to have_password_new
    expect(user_settings.passwords_form).to have_password_confirmation
    expect(user_settings.passwords_form).to have_submit
  end

  it 'Show form `AccountRemoveForm`' do
    user_settings.privacy_tab_link.click
    expect(user_settings).to have_account_remove_form
    expect(user_settings.account_remove_form).to have_remove_checkbox
    expect(user_settings.account_remove_form).to have_submit
  end
end
