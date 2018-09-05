class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.float :price
      t.integer :week_day

      t.timestamps
    end
  end
end
