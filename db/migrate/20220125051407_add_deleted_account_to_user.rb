class AddDeletedAccountToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deleted_account, :boolean, default: true
  end
end
