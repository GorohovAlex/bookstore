RSpec.describe Book, type: :model do
  context 'with associations' do
    it { is_expected.to have_many(:authors).class_name(Author) }
    it { is_expected.to have_many(:authors).dependent(:destroy) }
    it { is_expected.to have_many(:book_authors).class_name(BookAuthor) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(Book::TITLE_MAX_LENGTH) }
    it { is_expected.to allow_value(FFaker::Book.title.delete(':')).for(:name) }

    it { is_expected.to validate_presence_of(:price_cents) }
    it { is_expected.to validate_numericality_of(:price_cents).only_integer }

    it { is_expected.to validate_presence_of(:year_of_publication) }
    it { is_expected.to validate_numericality_of(:year_of_publication).only_integer }

    it { is_expected.to validate_length_of(:description).is_at_most(Book::TEXTBOX_MAX_LENGTH) }
  end
end
