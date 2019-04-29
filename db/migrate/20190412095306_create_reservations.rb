class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :reserved_date
      t.string :reserved_frame
      t.string :reserved_menu

      t.timestamps
    end
  end
end
