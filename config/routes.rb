Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/your/endpoint"
  end
  post "/graphql", to: "graphql#execute"
  # Defines the root path route ("/")
  # root "articles#index"
end
