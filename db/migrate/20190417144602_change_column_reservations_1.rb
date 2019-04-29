class ChangeColumnReservations1 < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :reserved_menu
    add_column :reservations, :remarks, :text
  end
end
