RSpec.describe Material, type: :model do
  context 'with associations' do
    it { is_expected.to have_and_belong_to_many(:books).class_name(Book) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
