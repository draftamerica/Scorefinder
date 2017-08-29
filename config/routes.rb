Rails.application.routes.draw do
  devise_for :users

  resources :users do
      resources :comments
  end

  resources :teams

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "teams#homepage"

  post "/save_team" => "teams#save_teams"
  get "/" => "teams#homepage"
  get "view_game/:scoreboard_id" => "teams#view_game"
  get "view_team/:team_id" => "teams#view_team"
  post "/display_weekly_data" => "teams#display_weekly_data"
  get "/display_weekly_data" => "teams#display_weekly_data"
end
