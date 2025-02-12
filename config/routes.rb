Rails.application.routes.draw do
  # Define the root path route ("/")
  root "home#index"

  # Rota para atualizar o gráfico dinamicamente
  get "update_chart", to: "home#update_chart"
  get 'latest_values', to: 'home#latest_values'
end