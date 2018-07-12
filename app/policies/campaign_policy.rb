# frozen_string_literal: true

class CampaignPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @campaign = model
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    @current_user.expert?
  end

  def edit?
    @current_user.expert?
  end

  def create?
    @current_user.expert?
  end

  def update?
    @current_user.expert?
  end

  def destroy?
    @current_user.expert?
  end
end
