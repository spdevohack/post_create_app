class Post < ApplicationRecord
  belongs_to :user
  validates :title, format: {with: /\A[A-Za-z\s]+\z/, message: "only letters are allowed"}, presence: true
  validates :description, length: {minimum: 50, message: "is too short please type again"}, presence: true
end
