class Todo < ApplicationRecord
  belongs_to :campaign
  belongs_to :creator, class_name: 'User'
  belongs_to :completed_by, class_name: 'User', optional: true
  has_many :comments, as: :commentable

  scope :desc_created_at, ->{ order(created_at: :desc)}

  validates_presence_of :title
end
