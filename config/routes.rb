TownParliament::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "pages/index"
  get "pages/meeting"
  get "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do

    resources :users

  end

  resources :acts, :amandments
  post '/create_head_intro', to: 'acts#create_head_intro'
  delete '/destroy_head', to:'acts#destroy_head'

  # REGULATION ROUTES
  post '/prepare_regulation', to: 'acts#prepare_regulation'
  post '/create_regulation', to: 'acts#create_regulation'
  delete '/destroy_regulation', to: 'acts#destroy_regulation'

  # SUBJECT ROUTES
  post '/prepare_subject', to: 'acts#prepare_subject'
  post '/create_subject', to: 'acts#create_subject'
  delete '/destroy_subject', to: 'acts#destroy_subject'

  root :to => "pages#index"

end
