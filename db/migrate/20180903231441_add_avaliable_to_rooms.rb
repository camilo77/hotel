class AddAvaliableToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :avaliable, :boolean
  end
end
