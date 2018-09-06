class Stay < ApplicationRecord
  belongs_to :guest
  belongs_to :room
  accepts_nested_attributes_for :guest
  accepts_nested_attributes_for :room
  validates :date_in, :date_out, :guest, :room,  presence: true
  validate :date_out_greater_than_date_in

  def date_out_greater_than_date_in
    if date_in >= date_out
      errors.add(:date_in, "date in can't be greater than date out")
    end
  end
end
