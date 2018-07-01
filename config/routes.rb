Rails.application.routes.draw do
	authenticated :admin_user, -> (admin_user) {not admin_user.blank?} do 
		mount Blazer::Engine, at: "blazer"
	end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :users, only: [:show]
  
	root 'static_pages#home'
	get 'help' => 'static_pages#help'
	get 'about' => 'static_pages#about'
end
