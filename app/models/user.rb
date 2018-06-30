class User < ApplicationRecord
  has_many :points

  validates :name, presence: true

  def total_points
    return 0 unless points.any?
    points.sum(:value)
  end
end
