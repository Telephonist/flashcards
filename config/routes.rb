# flashcards/config/routes.rb;
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  post 'check_translation' => 'welcome#check_translation'

  resources :cards, only: [:index, :show, :new, :edit, :create, :update, :destroy]

end
