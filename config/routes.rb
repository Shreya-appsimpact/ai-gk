Rails.application.routes.draw do
  root 'questions#index'
  resources :questions
  resources :categories
  get '/load_more_questions' => "questions#load_more_questions"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
