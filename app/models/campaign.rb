class Campaign < ApplicationRecord

  validates_presence_of :title, :duration

  belongs_to :creator, class_name: 'User', optional: true
end
