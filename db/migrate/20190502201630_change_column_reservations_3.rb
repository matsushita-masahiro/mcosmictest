class ChangeColumnReservations3 < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :reserved_frame
    add_column :reservations, :reserved_space, :string
  end
end
