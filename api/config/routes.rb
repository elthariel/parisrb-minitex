ParisrbMinitex::Application.routes.draw do
  api :version => 1 do
    resources :tex, :only => [:index, :show, :create]
    resources :hash_tags, :only => [:index, :show]
  end

  root to: 'tex#index', version: 1
end
