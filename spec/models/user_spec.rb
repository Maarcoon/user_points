require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { is_expected.to have_many(:points) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#total_points' do
    context 'when have points associated' do
      it 'should return the sum of points' do
        FactoryBot.create(:point, value: 10, user: subject)
        FactoryBot.create(:point, value: 20, user: subject)
        expect(subject.total_points).to eq(30)
      end
    end

    context 'when there are no points associated' do
      it 'should return 0' do
        expect(subject.total_points).to eq(0)
      end
    end
  end
end
