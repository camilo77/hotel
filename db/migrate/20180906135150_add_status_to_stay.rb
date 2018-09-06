class AddStatusToStay < ActiveRecord::Migration[5.2]
  def change
    add_column :stays, :status, :string
  end
end
