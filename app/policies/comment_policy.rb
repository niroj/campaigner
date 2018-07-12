# frozen_string_literal: true

class CommentPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @commentable = model.commentable
    @creator = model.commentable.creator
    @commentor = model.commentor
  end

  def create?
    @commentable.is_a?(Campaign) || @creator.novice?
  end

  def update?
    @current_user == @commentor
  end

  def destroy?
    @current_user == @commentor
  end
end
