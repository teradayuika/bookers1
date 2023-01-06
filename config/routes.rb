Rails.application.routes.draw do
  get 'books/new'
  resources :books
  
  get 'books/:id' => 'books#show',as:'show'
  get 'books/:id/edit' => 'books#edit',as:'edit'
  patch 'books/:id' => 'books#update', as: 'update'
  delete 'books/:id' => 'books#destroy', as: 'destroy'
  
  root :to => 'homes#top'
  get 'homes/top'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
