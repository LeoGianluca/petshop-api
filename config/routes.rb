Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :categories
      resources :products
      resources :species
      resources :breeds
      resources :pets
      resources :states
      resources :cities
      resources :services
      resources :payments
    end
  end
end
