require 'rails_helper'

RSpec.describe Point, type: :model do
  subject { FactoryBot.build(:point) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_numericality_of(:value).is_less_than_or_equal_to(3126) }
  end
end
