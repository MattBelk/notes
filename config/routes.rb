Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }
  # devise_scope :user do
  #   get '/users/sign_in', to: 'users/sessions#new', as: 'new_user_session'
  #   post '/users/sign_in', to: 'users/sessions#create', as: 'user_session'
  #   delete '/users/sign_out', to: 'users/sessions#destroy', as: 'destroy_user_session'
  # end


  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/users', to: redirect('/')



  
end
