class Todo < ApplicationRecord
  belongs_to :campaign
  belongs_to :creator, class_name: 'User', optional: true
  belongs_to :completed_by, class_name: 'User', optional: true

  validates_presence_of :title
end
