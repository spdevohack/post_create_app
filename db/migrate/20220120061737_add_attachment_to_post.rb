class AddAttachmentToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :attachment, :string
  end
end
