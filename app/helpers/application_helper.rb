# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    {
      'notice' => "alert-primary",
      'success' => "alert-success",
      'error' => "alert-danger",
      'alert' => "alert-danger"
    }[level.to_s]
  end
end
