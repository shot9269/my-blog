Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "blogs#index"
  resources :blogs do
    collection do
      get :each_title
    end
  end
  
end
