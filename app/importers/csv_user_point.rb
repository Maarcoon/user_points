class CSVUserPoint
  attr_reader :received_on, :name, :id, :points

  def initialize(csv_row)
    @received_on = csv_row[0]
    @name        = csv_row[1]
    @id          = csv_row[2]
    @points      = csv_row[3]
  end
end
