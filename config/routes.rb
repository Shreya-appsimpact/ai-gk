Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  get '/news' => "questions#news"
  get '/download_pdf' => "questions#download_pdf"
  resources :questions do
    collection do
      post :import
    end
  end 

  resources :categories
  get '/load_more_questions' => "questions#load_more_questions" 
  get '/download_pdf' => "questions#download_pdf"
  get '/download_pdf_based_category' => "categories#download_pdf_based_category"
  namespace :admin do
    resources :categories
    get '/load_more_questions' => "questions#load_more_questions" 
    get '/download_pdf' => "questions#download_pdf"
    get '/news' => "questions#news"
    get '/download_pdf_based_category' => "categories#download_pdf_based_category"
    resources :questions do
      collection do
        post :import
      end
    end
  end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
