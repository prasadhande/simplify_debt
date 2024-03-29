Rails.application.routes.draw do
  resources :groups do
    member do
      get :overall_debt_view, :simplified_debt_view
    end
    resources :group_members do
      resources :expenses
      resources :payments
    end
  end

  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
