class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commentor, class_name: 'User'

  scope :desc_created_at, ->{ order(created_at: :desc)}
end
