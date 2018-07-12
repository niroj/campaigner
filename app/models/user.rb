# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[novice expert]
  enum status: %i[qualified not_qualified banned]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_campaigns, class_name: 'Campaign', foreign_key: 'creator_id'

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :novice
  end

  def set_default_status
    self.role ||= :not_qualified
  end

end
