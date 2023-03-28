Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  get 'products/index'
  get 'products/show'
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  resources :products
  namespace :api do
    namespace :v1 do
      resources :authors do
        resources :books
      end
    end
  end


  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
end
