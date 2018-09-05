class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :nombre
      t.string :apellido
      t.integer :documento

      t.timestamps
    end
  end
end
