class Guest < ApplicationRecord
  belongs_to :membership
  has_many :stays

  validates :documento, uniqueness: true
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :documento, presence: true

end
