RSpec.describe Category, type: :model do
  context 'with associations' do
    it { is_expected.to have_many(:books).class_name(Book) }
    it { is_expected.to have_many(:books).dependent(:nullify) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
