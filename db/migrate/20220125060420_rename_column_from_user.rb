class RenameColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :deleted_account
    add_column :users, :deleted_at, :datetime
  end
end
