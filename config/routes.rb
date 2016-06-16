TownParliament::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "pages/index"
  get "pages/acts"
  get "pages/show"
  get "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do

    resources :users

  end

  resources :acts, :amandments
  post '/create_head_intro', to: 'acts#create_head_intro'
  delete '/destroy_head', to:'acts#destroy_head'

  root :to => "pages#index"

end
