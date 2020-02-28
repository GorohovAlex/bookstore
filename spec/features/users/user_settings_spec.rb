describe 'User (Settings) page' do
  let(:current_user) { create(:user) }
  let(:user_settings) { Pages::UserSettingsPage.new }
  let(:address) { build(:address) }
  let(:address_forms) { [user_settings.billing_address_form, user_settings.shipping_address_form] }

  before do
    login_as(current_user, scope: :user)
    user_settings.load
  end

  it 'Show tabs' do
    expect(user_settings).to have_address_tab_link
    expect(user_settings).to have_privacy_tab_link
  end

  it 'Show form' do
    expect(address_forms).to all(have_first_name)
    expect(address_forms).to all(have_last_name)
    expect(address_forms).to all(have_address)
    expect(address_forms).to all(have_city)
    expect(address_forms).to all(have_zip)
    expect(address_forms).to all(have_country)
    expect(address_forms).to all(have_phone)
    expect(address_forms).to all(have_submit)
  end

  # rubocop:disable RSpec/ExampleLength
  it 'Send form with empty values' do
    address_forms.each do |form|
      form.first_name.input.set address.first_name
      form.last_name.input.set address.last_name
      form.address.input.set address.address
      form.city.input.set address.city
      form.zip.input.set address.zip
      form.country.select.find("option[value='#{address.country}']").select_option
      form.phone.input.set address.phone
      form.submit.click
      expect(user_settings).to have_notice
    end
  end
  # rubocop:enable RSpec/ExampleLength.

  it 'Send form with valid values' do
    address_forms.each do |form|
      form.submit.click
      expect(form.last_name).to have_error
      expect(form.address).to have_error
      expect(form.city).to have_error
      expect(form.zip).to have_error
      expect(form.country).to have_error
      expect(form.phone).to have_error
      expect(form).to have_submit
    end
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
