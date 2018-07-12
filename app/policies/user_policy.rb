# frozen_string_literal: true

class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.expert?
  end

  def show?
    @current_user.expert? || (@current_user == @user)
  end

  def update?
    @current_user.expert?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.expert?
  end
end
