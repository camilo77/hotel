class CreateStays < ActiveRecord::Migration[5.2]
  def change
    create_table :stays do |t|
      t.date :date_in
      t.date :date_out
      t.belongs_to :guest, index: true, foreign_key: true
      t.belongs_to :room, index: true, foreign_key: true
      t.timestamps
    end
  end
end
