class Rate < ApplicationRecord
  belongs_to :room

  validates :room, presence: true
  validates :price, presence: true
  validates :week_day, presence: true
  validates :week_day, inclusion: { in: [ 1, 2, 3, 4, 5, 6, 0 ] }
end
