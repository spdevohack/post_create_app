class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :posts

  def posts
    object.posts.map do |post|
      id = post.id
      title = post.title
      description  = post.description
    end

  end
end
