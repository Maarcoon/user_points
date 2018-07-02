require 'rails_helper'
require 'csv'

RSpec.describe UserPointsImporter do
  describe '#import' do
    context 'when the csv contains 91 points' do
      it 'should assing points to user based on csv row' do
        UserPointsImporter.new('spec/support/regular_points.csv').import
        expect(User.last.total_points).to eq(91)
      end

      it 'should not assign points if user already have 3126 points' do
        user = User.create(id: 84, name: 'Felipe')
        points = Point.create(user: user, value: 3126, received_on: Date.current)
        UserPointsImporter.new('spec/support/regular_points.csv').import
        expect(user.points.count).to eq(1)
      end
    end

    context 'when the csv contains more than 3129 points' do
      it 'should assign the limit of 3126 points to user' do
        UserPointsImporter.new('spec/support/break_point_limit.csv').import
        expect(User.last.total_points).to eq(3126)
      end
    end
  end
end
