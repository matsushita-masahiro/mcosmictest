class ChangeColumnUsers1 < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :family_name, :name
    rename_column :users, :first_name, :name_kana
    add_column :users, :remarks, :text
    add_column :users, :membership_number, :string
    add_column :users, :user_type, :string
  end
end
