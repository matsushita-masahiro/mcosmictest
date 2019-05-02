class AddColumnReserve < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :remarks, :text
  end
end
