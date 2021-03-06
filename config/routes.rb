Rails.application.routes.draw do
  get 'static_blogs/blog'
  devise_for :users
  root 'questions#index'
  get '/news' => "questions#news"
  get '/download_pdf' => "questions#download_pdf"
  resources :questions do
    collection do
      post :import
    end
  end
  resources :videos, only: [:index, :show] 

  resources :categories
  get '/questions_by_month' => "questions#questions_by_month"
  get '/download_pdf' => "questions#download_pdf"
  get '/blog' => "static_blogs#blog"
  get '/subject_category' => "static_blogs#subject_category"
  get '/book' => "static_blogs#book"
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
    resources :videos
  end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
