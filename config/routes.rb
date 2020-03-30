Rails.application.routes.draw do

  root 'events#index'
  
  devise_for :users

  resources :events 
  resources :states

  get 'signup',to:'users#new'

  resources :users,except:[:new] 


  get 'login',to:'sessions#new'
  post 'login',to:'sessions#create'	
  delete 'logout',to:'sessions#destroy'
  	  
end
