Rails.application.routes.draw do
  get 'users/index'
  mount_devise_token_auth_for 'User', at: 'auth'
	  namespace :api do
		namespace :v1 do
		  resources :users do
				collection do
				  get 'showAllDev'
				  get 'showAllQa'
				end
			end
		  resources :projects do
				member do	      	
					get 'showProjectDev'
					get 'showProjectQa'
					put 'addResource'
					delete 'delResource'
				end

			  resources :bugs do
					collection do
						get 'assignedBugs'
					end
				end
			end
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
