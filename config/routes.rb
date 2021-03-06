# frozen_string_literal: true

Rails.application.routes.draw do

  resources :comments, only: [:create, :update]
  resources :campaigns do
    resources :todos, only: [:index, :create, :edit, :update, :destroy, :show]
  end

  devise_for :users
  resources :users

  root to: 'campaigns#index'
end
