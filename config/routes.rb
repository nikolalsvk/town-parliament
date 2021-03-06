TownParliament::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "pages#index"

  get "pages/index"
  get "pages/meeting"
  get "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do
    resources :users
  end

  resources :acts do
    # HTML AND PDF
    get '/html', to: 'acts#html'
    get '/pdf', to: 'acts#pdf'
  end

  resources :amandments

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

  # CLAUSE ROUTES
  post '/prepare_clause', to: 'acts#prepare_clause'
  post '/create_clause', to: 'acts#create_clause'
  delete '/destroy_clause', to: 'acts#destroy_clause'

  # STANCE ROUTES
  post '/prepare_stance', to: 'acts#prepare_stance'
  post '/create_stance', to: 'acts#create_stance'
  delete '/destroy_stance', to: 'acts#destroy_stance'

  # DOT ROUTES
  post '/prepare_dot', to: 'acts#prepare_dot'
  post '/create_dot', to: 'acts#create_dot'
  delete '/destroy_dot', to: 'acts#destroy_dot'

  # SUBDOT ROUTES
  post '/prepare_subdot', to: 'acts#prepare_subdot'
  post '/create_subdot', to: 'acts#create_subdot'
  delete '/destroy_subdot', to: 'acts#destroy_subdot'

  # PARAGRAPH ROUTES
  post '/prepare_paragraph', to: 'acts#prepare_paragraph'
  post '/create_paragraph', to: 'acts#create_paragraph'
  delete '/destroy_paragraph', to: 'acts#destroy_paragraph'

  # SEARCH SHIT
  get :search, to: 'search#index'
  get :perform_search, to: 'search#perform'

end
