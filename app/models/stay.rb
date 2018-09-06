class Stay < ApplicationRecord
  belongs_to :guest
  belongs_to :room

  accepts_nested_attributes_for :guest
  accepts_nested_attributes_for :room

  validates :date_in, :date_out, :guest, :room, :status, presence: true
  validate :date_out_greater_than_date_in
  validate :room_avaliability
  validates :status, inclusion: { in: [ "checkin", "checkout" ] }

  before_save :edit_room_avaliability
  after_save :save_room

  def save_room
    room.save
  end

  def edit_room_avaliability
    if room.avaliable == true
      room.avaliable = false
    else
      room.avaliable = true
    end
  end

  def date_out_greater_than_date_in
    if date_in.present? && date_out.present? && date_in >= date_out
      errors.add(:date_in, "date in can't be greater than date out")
    end
  end

  def room_avaliability
    if room.present? && room.avaliable == false
      errors.add(:room, "room no avaliable")
    end
  end
end
