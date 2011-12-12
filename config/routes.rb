VeleHanden::Application.routes.draw do

  match '/:locale' => 'home#index'
  root :to => 'home#index'

  scope "(:locale)", :locale => /en|nl/ do
    resources :wikis do
      resources :pages
    end

    # Comments
    post "comments" => "comments#create",  as: :create_comment
    delete "comments/:id" => "comments#destroy", as: :destroy_comment
    get "comments/:id" => "comments#show", as: :comment

    devise_for :users

    # Users
    get "users/search(.format)" => "users#search", as: :search_user
    get "users/:user_id(.:format)" => "users#view",     as: :user
  end




    # See how all your routes lay out with "rake routes"
end
