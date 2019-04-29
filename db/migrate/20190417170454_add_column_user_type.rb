class AddColumnUserType < ActiveRecord::Migration[5.0]
  def change
    add_column :user_types, :price, :integer
  end
end
