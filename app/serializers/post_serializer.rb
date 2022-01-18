class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user

  def user
    id = object.user.id,
    first_name = object.user.name
  end

end
