Rails.application.routes.draw do

  devise_for :users
  root 'users#new'
  
  resources :events

  get 'signup',to:'users#new'

  resources :users,except:[:new]

  get 'login',to:'sessions#new'
  post 'login',to:'sessions#create'	
  delete 'logout',to:'sessions#destroy'
  	  
end
