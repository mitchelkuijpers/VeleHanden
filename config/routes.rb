VeleHanden::Application.routes.draw do

  root :to => 'home#index'

  # Wiki
  get "/wikis/overview" => "wikis#overview", as: :wiki_overview

  # scope "(:locale)", :locale => /en|nl/ do
    resources :wikis do
      resources :pages
    end

    resources :pages do
      resources :page_photos, only: [:create, :new]
      resources :page_videos, only: [:create, :new]
    end

    # Comments
    post "comments(.:format)" => "comments#create",  as: :create_comment

    #Vimeo
    get "pages/:page_id/vimeo/search(.:format)" => "page_videos#search_vimeo", as: :search_vimeo



    # PageContents


    devise_for :users

    # Users
    get "users/search(.format)" => "users#search", as: :search_user
    get "users/:user_id(.:format)" => "users#view",     as: :user
  # end




    # See how all your routes lay out with "rake routes"
end
