class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commentor, class_name: 'User'
end
