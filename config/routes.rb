Rails.application.routes.draw do

  root 'pages#home'
  get 'portfolio'       =>'pages#portfolio'
  get 'contact'         =>'pages#contact'
  get 'blog'            =>'articles#blog'
  get 'show'            =>'articles#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
