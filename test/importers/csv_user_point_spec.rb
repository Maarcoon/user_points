require 'rails_helper'

RSpec.describe CSVUserPoint do
  describe '.new' do
    context 'with valid attributes' do
      it 'should initialize a new instance of class' do
        valid_params = [Date.current, Faker::Name.name, 10, 100]
        expect(CSVUserPoint.new(valid_params)).to be_instance_of(CSVUserPoint)
      end
    end

    context 'with invalid attributes' do
      it 'should raise an error' do
        invalid_params = Faker::Name.name
        expect(CSVUserPoint.new(invalid_params)).to raise_error
      end
    end
  end
end
