class Defaultpoststate < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :state, :integer, default: "published"
  end
end
