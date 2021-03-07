RSpec.describe CartItem do
  context 'with associations' do
    it { is_expected.to belong_to(:book).class_name(Book) }
  end
end
