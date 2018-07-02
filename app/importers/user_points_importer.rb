require 'csv'

class UserPointsImporter
  attr_accessor :csv_rows, :csv_user_points

  def initialize(csv_file_path)
    @csv_rows = CSV.read(csv_file_path)
    @csv_user_points = csv_rows.map { |csv_row| CSVUserPoint.new(csv_row) }
  end

  def import
    csv_user_points.each do |csv_user_point|
      user = User.find_or_create_by(id: csv_user_point.id)
      next if user.total_points == 3126
      assign_points_to(user, csv_user_point)
    end
  end

  def assign_points_to(user, csv_user_point)
    total = user.total_points + csv_user_point.points.to_i
    value = total > 3126 ? 3126 - user.total_points : csv_user_point.points
    received_on = Date.parse(csv_user_point.received_on)
    user.update_attributes(name: csv_user_point.name)
    user.points.create(received_on: received_on, value: value)
  end
end
