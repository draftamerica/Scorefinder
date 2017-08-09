Rails.application.routes.draw do
  devise_for :users

  resources :users do
      resources :comments
  end

  resources :teams

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "teams#homepage"
  # get "/" => "teams#get_nfl_data"
  # get "/" => "users#homepage"
  # patch "/user" => "users#save_teams"

  post "/save_team" => "teams#save_teams"
  get "/" => "teams#homepage"
  get "view_game/:game_id" => "teams#view_game"
  # post "/search_games" => "users#search_games"
  # get "/search_games" => "users#search_games"
  post "/display_weekly_data" => "teams#display_weekly_data"
  get "/display_weekly_data" => "teams#display_weekly_data"
  # get "/get_nfl_data" => "users#search_games"
  # get "/search_games" => "users#get_nfl_data"

  # post "/save_teams/" => "users#save_teams"
end
