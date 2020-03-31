Rails.application.routes.draw do

  root 'events#index'
  
  devise_for :users

  resources :events 
  resources :states

  resources :users,except:[:new] 

  patch 'adduser',to:'states#adduser'

end
