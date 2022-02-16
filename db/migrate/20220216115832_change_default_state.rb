class ChangeDefaultState < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :state, :integer,  default: 1
  end
end
