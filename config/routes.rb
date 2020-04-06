Rails.application.routes.draw do

  devise_for :users
  root 'evennts#index'
  
  resources :evennts 
  resources :states 

  resources :users,except:[:new] 

  patch 'updatestate',to:'dashboard#updatestate'

  get 'dashboard' ,to:'dashboard#allevents'

  get 'pendinginvite' ,to:'dashboard#pendinginvite'
end
