# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'campaigns#index'

  resources :campaigns
  devise_for :users
  resources :users
end
