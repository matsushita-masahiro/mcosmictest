class RemoveColumnUsertype < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_types, :user_type
  end
end
