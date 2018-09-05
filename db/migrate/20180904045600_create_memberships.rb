class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.string :nombre
      t.float :discount
      t.timestamps
    end
  end
end
