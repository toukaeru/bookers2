Rails.application.routes.draw do
  get 'books/index'
  root to: 'homes#top'
  devise_for :users
  get 'homes/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
