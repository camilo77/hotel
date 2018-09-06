require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "method avaliables should return only avaliable rooms" do
    rooms = Room.create( [ { number: 101, floor: 1, bed_number: 2, guests_number: 3, avaliable: true },
                           { number: 102, floor: 1, bed_number: 1, guests_number: 2, avaliable: true },
                           { number: 103, floor: 1, bed_number: 3, guests_number: 4, avaliable: false }
                        ] )

    avaliablesRooms = Room.avaliables
    expectedRooms = [ Room.find_by(number: 101), Room.find_by(number: 102) ]
    assert_equal(expectedRooms, avaliablesRooms)
  end
end
