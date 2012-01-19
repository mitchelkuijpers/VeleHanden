VeleHanden::Application.routes.draw do

  root :to => 'home#index'

  # Pages
  get "/pages/overview" => "pages#overview", as: :pages_overview
  get "/pages/overview/best" => "pages#overview_best",  as: :pages_overview_best
  post "pages/likes/add(.:format)" => "page_likes#create",  as: :create_page_like

  resources :wikis do
    resources :pages
  end

  resources :pages do
    resources :page_photos, only: [:create, :new]
    resources :page_videos, only: [:create, :new]
    resources :time_line_items, only: [:create, :new]
  end

  # Comments
  post "comments(.:format)" => "comments#create",  as: :create_comment

  #Vimeo
  get "pages/:page_id/vimeo/search(.:format)" => "page_videos#search_vimeo", as: :search_vimeo

  devise_for :users

  # Users
  get "users/search(.format)" => "users#search", as: :search_user
  get "users/:user_id(.:format)" => "users#view",     as: :user

end
