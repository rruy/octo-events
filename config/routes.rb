Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  match "/issues" => "issues#index", via: :get, as: :issues
  match "/issues/new" => "issues#new", via: :post, as: :new_issues
  get "issues/:id/events" => "issues#show", via: :get, as: :events_issues

  # Defines the root path route ("/")
  root "issues#index"
end
