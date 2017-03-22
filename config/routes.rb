Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'reports#dashboard'

  get 'home', to: 'reports#dashboard', as: :home

  get 'signin', to: 'sessions#new', as: :signin
  delete 'signout', to: 'sessions#destroy',  as: :signout

  get 'signup',  to: 'users#new',  as: :signup
  get '/users/search', to: 'users#search', as: :search_user
  get '/users/:id/edit_password', to: 'users#edit_password', as: :edit_user_password
  match '/users/:id/update_password', to: 'users#update_password', as: :update_user_password, via: [:get, :post]
  get '/users/:id/reset', to: 'users#reset', as: :reset
  match '/users/:id/reset_password', to: 'users#reset_password', as: :reset_user_password, via: [:get, :post]

  get 'recaps/select_options', to: 'reports#select_options', as: :recaps_select_options
  get 'recaps/select_year', to: 'reports#select_year', as: :recaps_select_year
  post 'recaps/summary_info', to: 'reports#summary_info', as: :summary_info
  post 'recaps/summary_final', to: 'reports#summary_final', as: :summary_final
  get 'recaps/summary_final', to: 'reports#summary_final', as: :summary_final_get

  get 'events/:id/info_type', to: 'reports#event_info_type', as: :info_type_for_event
  post 'events/:id/info', to: 'reports#event_info', as: :event_info

  get 'events/search', to: 'events#search', as: :search_event
  get 'events/:id/items', to: 'events#items', as: :items_for_event
  get 'events/:id/dates', to: 'events#dates', as: :dates_for_event
  get 'events/:id/item_types', to: 'events#item_types', as: :item_types_for_event

  get 'events/:id/new_item', to: 'event_items#new', as: :new_event_item
  get 'events/:id/edit_items', to: 'event_items#edit_items', as: :edit_event_items
  post '/events/:id/update_items', to: 'event_items#updates', as: :update_event_items
  
  get 'events/:id/new_date', to: 'event_dates#new', as: :new_event_date

  get '/items/download', to: 'items#download', as: :download_items 

  resources :events
  resources :event_items, except: [:index, :show, :new]
  resources :event_dates, except: [:index, :show, :new]
  resources :items, except: :show
  resources :item_types, except: :show
  resources :event_types, except: :show
  resources :event_item_types, only: [:edit, :update]
  resources :event_info_types
  resources :users, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]
end
