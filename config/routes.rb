Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :questions
  resources :categories
  get '/load_more_questions' => "questions#load_more_questions" 
  get '/download_pdf' => "questions#download_pdf"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
