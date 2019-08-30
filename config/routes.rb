Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :api, defaults: { format: :json } do
		namespace :v1 do
			resources :users, only: [:index] do
				collection do
				  get "me"
				  get "sign_in"
				  get "sign_out"
				  post "sign_up"
				end
			end
		end
	end

end
