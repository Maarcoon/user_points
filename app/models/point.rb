class Point < ApplicationRecord
  belongs_to :user

  validates :value, numericality: { less_than_or_equal_to: 3126,  only_integer: true }
end
