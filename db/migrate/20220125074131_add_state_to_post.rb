class AddStateToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :state, :integer, default:0
  end
end
