RSpec.describe Cover, type: :model do
  it { is_expected.to belong_to(:book) }
end
