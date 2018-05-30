Rails.application.routes.draw do

  root 'subs#index'

  resources :subs do 
    resources :topics
  end

  scope '/topics/:topic_id', as: 'topic' do
    resources :comments, only: [:new, :create]
  end
end
