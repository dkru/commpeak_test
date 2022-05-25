Rails.application.routes.draw do
  root "messages#index"
  resources :messages, except: [:edit, :show, :update] do
    collection { get :import }
  end
end
