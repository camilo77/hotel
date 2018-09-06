class Stay < ApplicationRecord
  belongs_to :guest
  belongs_to :room
  accepts_nested_attributes_for :guest
  accepts_nested_attributes_for :room
  validates :date_in, :date_out, :guest, :room,  presence: true
end
