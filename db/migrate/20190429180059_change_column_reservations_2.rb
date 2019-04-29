class ChangeColumnReservations2 < ActiveRecord::Migration[5.0]
  def change
    change_column :reservations, :reserved_frame, :string
  end
end
