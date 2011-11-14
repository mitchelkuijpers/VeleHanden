VeleHanden::Application.routes.draw do

  match '/:locale' => 'home#index'
  root :to => 'home#index'

  scope "(:locale)", :locale => /en|nl/ do
    devise_for :users

    # Users

    get "users/search(.format)" => "users#search", as: :search_user
    get "users/:user_id(.:format)" => "users#view",     as: :user
  end




    # See how all your routes lay out with "rake routes"
end
