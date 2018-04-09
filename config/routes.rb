Rails.application.routes.draw do
	ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quizzes do
  	resources :questions 
  	get '/add_level/:id', to: 'quizzes#add_level', as: 'add_level'
  end

  root 'quizzes#home'
  get '/quizzes/end_response', to: 'quizzes#end_response'


end
