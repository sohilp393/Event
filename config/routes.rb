Rails.application.routes.draw do

  devise_for :users
  root 'evennts#index'
  
  resources :evennts 
  resources :states 

  resources :users,except:[:new] 

  patch 'adduser',to:'states#adduser'

  get 'dashboard' ,to:'dashboard#allevents'

  get 'pendinginvite' ,to:'dashboard#pendinginvite'
end
