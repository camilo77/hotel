class AddRoomToRate < ActiveRecord::Migration[5.2]
  def change
    add_reference :rates, :room, foreign_key: true
  end
end
