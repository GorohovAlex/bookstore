RSpec.describe Author, type: :model do
  context 'with associations' do
    it { is_expected.to have_many(:books).class_name(Book) }
    it { is_expected.to have_many(:books).dependent(:destroy) }
    it { is_expected.to have_many(:book_authors).class_name(BookAuthor) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(Author::NAME_MAX_LENGTH) }
    it { is_expected.to allow_value(FFaker::Name.first_name).for(:first_name) }

    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(Author::NAME_MAX_LENGTH) }
    it { is_expected.to allow_value(FFaker::Name.last_name.gsub(/\W/, '')).for(:last_name) }
  end
end
