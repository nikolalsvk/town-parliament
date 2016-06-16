TownParliament::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "pages/index"
  get "pages/meeting"
  get "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do

    resources :users

  end

  resources :acts, :amandments

  root :to => "pages#index"

end
