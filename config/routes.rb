require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :finests, only: [:index, :show, :create, :update, :destroy]
    end
  end


  post 'user_token' => 'user_token#create'

end
