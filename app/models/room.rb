class Room < ApplicationRecord
  has_many :rates, dependent: :destroy
  has_many :stays

  validates :number, uniqueness: true
  validates :number, presence: true
  validates :floor, presence: true
  validates :bed_number, presence: true
  validates :guests_number, presence: true
  validates :avaliable, inclusion: { in: [ true, false ] }

  def self.avaliables
    where("avaliable = ?", true)
  end

  def as_json( options = {})
    super(
      :only => [:number, :floor, :bed_number, :guests_number],
      :include => {
        :rates => {:only => [:price, :week_day]}
      }
    )
  end
end
