Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'products#index'
    end
  end
end
