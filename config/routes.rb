# frozen_string_literal: true

Rails.application.routes.draw do

  resources :campaigns do
    resources :todos
  end

  devise_for :users
  resources :users

  root to: 'campaigns#index'
end
