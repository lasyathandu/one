Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  resources :events 
  get 'school/new'
resources :school do
		member do 
			get :delete
		end
	end



  end
