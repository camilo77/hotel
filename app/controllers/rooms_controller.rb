class RoomsController < ApplicationController

  def avaliable
    rooms = Room.avaliables
    json_rooms = rooms.map { |elemento| elemento.as_json }
    render json: { rooms: json_rooms}, status: :ok
  end

  def roomCheckin

    guest = Guest.find_by(checkin_params[:guest])
    room = Room.find_by(checkin_params[:room])

    if guest.present? && room.present?
      stay = Stay.new( checkin_params[:stay] )
      stay.guest = guest
      stay.room = room
      stay.save!

    end
  end

  private
    #string parameters to protect data entry of the stay post (check in)
    def checkin_params
      params.require(:checkin).require(:room).require( :number )
      params.require(:checkin).require(:guest).require( :documento )
      params.require(:checkin).require(:stay).require( [:date_in, :date_out] )
      params.require(:checkin).permit( stay: [ :date_in, :date_out],
                                       room: [ :number ],
                                       guest: [ :documento, :nombre ]
                                     )
    end
end