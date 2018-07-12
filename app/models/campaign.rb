class Campaign < ApplicationRecord

  validates_presence_of :title, :duration

  belongs_to :creator, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :todos
end
