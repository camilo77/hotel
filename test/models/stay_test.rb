require 'test_helper'

class StayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save a stay without room, guest, date_in and date_out" do
    stay = Stay.new(date_in: "12/12/2018")
    assert_not stay.save
  end

  test "should save a stay with room, guest, date_in and date_out" do
    room= Room.create( number: 101, floor: 1, bed_number: 2,
                       guests_number: 3, avaliable: true )
    membership = Membership.create( nombre: "oro", discount: 0.1 )
    guest = Guest.create( nombre: "sebastian", apellido: "pineda",
                          documento: 12345, membership: Membership.find_by( nombre: "oro" ) )

    stay = Stay.new(date_in: "12/12/2018", date_out: "13/12/2018",room: room, guest: guest )
    assert stay.save
  end

  test "should not save a stay with date_in greater or equal than date_out" do
    room= Room.create( number: 101, floor: 1, bed_number: 2,
                       guests_number: 3, avaliable: true )
    membership = Membership.create( nombre: "oro", discount: 0.1 )
    guest = Guest.create( nombre: "sebastian", apellido: "pineda",
                          documento: 12345, membership: Membership.find_by( nombre: "oro" ) )

    stay = Stay.new(date_in: "13/12/2018", date_out: "12/12/2018",room: room, guest: guest )
    assert_not stay.save
  end

  test "should save a stay with date_out greater or equal than date_in" do
    room= Room.create( number: 101, floor: 1, bed_number: 2,
                       guests_number: 3, avaliable: true )
    membership = Membership.create( nombre: "oro", discount: 0.1 )
    guest = Guest.create( nombre: "sebastian", apellido: "pineda",
                          documento: 12345, membership: Membership.find_by( nombre: "oro" ) )

    stay = Stay.new(date_in: "12/12/2018", date_out: "13/12/2018",room: room, guest: guest )
    assert stay.save
  end

  test "should not save a stay with a room no avaliable" do
    room= Room.create( number: 101, floor: 1, bed_number: 2,
                       guests_number: 3, avaliable: false )
    membership = Membership.create( nombre: "oro", discount: 0.1 )
    guest = Guest.create( nombre: "sebastian", apellido: "pineda",
                          documento: 12345, membership: Membership.find_by( nombre: "oro" ) )

    stay = Stay.new(date_in: "12/12/2018", date_out: "13/12/2018",room: room, guest: guest )
    assert_not stay.save
  end

  test "should save a stay with a room avaliable" do
    room= Room.create( number: 101, floor: 1, bed_number: 2,
                       guests_number: 3, avaliable: true )
    membership = Membership.create( nombre: "oro", discount: 0.1 )
    guest = Guest.create( nombre: "sebastian", apellido: "pineda",
                          documento: 12345, membership: Membership.find_by( nombre: "oro" ) )

    stay = Stay.new(date_in: "12/12/2018", date_out: "13/12/2018",room: room, guest: guest )
    assert stay.save
  end

  test "should update room avaliability after save a stay" do
    room= Room.create( number: 101, floor: 1, bed_number: 2,
                       guests_number: 3, avaliable: true )
    membership = Membership.create( nombre: "oro", discount: 0.1 )
    guest = Guest.create( nombre: "sebastian", apellido: "pineda",
                          documento: 12345, membership: Membership.find_by( nombre: "oro" ) )

    stay = Stay.new(date_in: "12/12/2018", date_out: "13/12/2018",room: room, guest: guest )
    assert stay.save
    room = Room.find_by(number:101)
    assert_equal(false, room.avaliable)
  end
end
