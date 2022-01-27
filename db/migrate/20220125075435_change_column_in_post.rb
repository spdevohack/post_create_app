class ChangeColumnInPost < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:posts, :state, from: "draft", to: "nil")
  end
end
