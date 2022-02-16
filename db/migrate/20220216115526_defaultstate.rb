class Defaultstate < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:posts, :state, from: "nil", to: "published")
  end
end
