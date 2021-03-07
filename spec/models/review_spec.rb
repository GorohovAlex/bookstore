RSpec.describe Review do
  context 'with associations' do
    it { is_expected.to belong_to(:book).class_name(Book) }
    it { is_expected.to belong_to(:user).class_name(User) }
  end
end
