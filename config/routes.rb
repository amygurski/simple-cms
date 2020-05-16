Rails.application.routes.draw do
  root 'demo#index'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end
  
  resources :subjects do
    member do
      get :delete
    end
  end

  #resourceful routes
  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  get 'example/index'
  get 'example/two'
  get 'example/three'
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  get ':controller(/:action(:/id))' #note depreciated in rails 6.1
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
