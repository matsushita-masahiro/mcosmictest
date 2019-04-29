class ChangeColumnReservations < ActiveRecord::Migration[5.0]
  def change
    change_column :reservations, :reserved_frame, :integer
  end
end
