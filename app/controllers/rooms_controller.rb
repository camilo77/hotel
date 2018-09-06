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
      stay.status = "checkin"
      if stay.save
        render json: { message: "checkin created"}, status: :ok
      else
        render json: { errors: stay.errors.full_messages }, status: :bad_request
      end
    else
      render json: { errors: "No room or guest"}, status: :bad_request
    end
  end

  def roomCheckout
    ####
    puts checkout_params
    guest = Guest.find_by( checkout_params[:guest] )
    room = Room.find_by( checkout_params[:room] )
    ####
    puts guest.nombre
    if guest.present? && room.present?
      stay = Stay.find_by( guest: guest, room: room, status: "checkin" )
      if stay.present?
        stay.checkout
      end
      ####
      puts stay.date_in
    end
    render json: { message: "checkout created"}, status: :ok
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

    def checkout_params
      params.require(:checkout).require(:guest).require( :documento )
      params.require(:checkout).require(:room).require( :number )
      params.require(:checkout).permit(
                                       guest: [ :documento ],
                                       room: [ :number ],
                                       products: [ product: [:name, :cantidad] ]
                                     )
    end

end
