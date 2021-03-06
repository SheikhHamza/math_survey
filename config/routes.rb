Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'quizzes#home'
  get '/quizzes/End', to: 'quizzes#end_response'
  get '/quizzes/Completed', to: 'quizzes#already_taken'

  resources :quizzes do
  	resources :questions 
  	get '/add_level/:id', to: 'quizzes#add_level', as: 'add_level'
  end


end
