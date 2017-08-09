# puts "*******+++ nfl_url.inspect, #{nfl_url.inspect}*****"
# puts "******@nfl_data.inspect, #{@nfl_data.inspect}"
# puts "******@nfl_data['id'].inspect, #{@nfl_data['id'].inspect}"
# puts "******@nfl_data['weeks'].inspect, #{@nfl_data['weeks'].inspect}"
# puts "******@nfl_data['weeks'][0].inspect, #{@nfl_data['weeks'][0].inspect}"
# puts "******@nfl_data['weeks'][0]['games'].inspect, #{@nfl_data['weeks'][0]['games'].inspect}"
# puts "******@nfl_data['weeks'][0]['games'][0].inspect, #{@nfl_data['weeks'][0]['games'][0].inspect}"
# puts "******...['home']['name'].inspect, #{@nfl_data['weeks'][0]['games'][0]['home']['name'].inspect}"
# puts "******...['home']['name'].inspect, #{@nfl_data['weeks'][0]['games'][0]['home']['name'].inspect}"
# puts "******...['scoring'].inspect, #{@nfl_data['weeks'][0]['games'][0]['scoring'].inspect}"
# puts "******...['scoring']['home_points'].inspect, #{@nfl_data['weeks'][0]['games'][0]['scoring']['home_points'].inspect}"
# puts "******...['scoring']['away_points'].inspect, #{@nfl_data['weeks'][0]['games'][0]['scoring']['away_points'].inspect}"
# puts "******@nfl_data.inspect, #{@nfl_data.inspect}"
# puts "******@nfl_data.inspect, #{@nfl_data.inspect}"

# <%= form_tag("/save_teams", method: "post") do %>
#             <div class="data-value">
#                 <%= select_tag("team_id", options_for_select(@teamsarray)) %> <br />
#             </div>
#         <div class="data">
#             <div class="data-label">&nbsp;</div>
#             <div class="data-value"><%= submit(value = "save") %></div>
#         </div>
#     </div>
# <% end %>


# <%= form_for :team do |f| %>
# <%= select_tag("Favorite Team", options_for_select(@teamsarray)) %> <br />
#   <%= f.submit %>
# <% end %>


# <!-- <p>
# <%= select_tag("Favorite Team", options_for_select(@teamsarray)) %>
# </p>
#
# <%= form_with(model: @user) do |form| %>
#   <% if @user.errors.any? %>
#     <div id="error_explanation">
#       <h2><%= pluralize(@user.errors.count, "error") %> prohibited this user from being saved:</h2>
#
#       <ul>
#       <% @user.errors.full_messages.each do |message| %>
#         <li><%= message %></li>
#       <% end %>
#       </ul>
#     </div>
#   <% end %>
#
#   <div class="actions">
#   <%= form.submit %>
# </div>
# <% end %> -->
#
# <!-- pass @users variable into form
# construct form using f/form loop element must have name of team_id -->

Rails.application.routes.draw do
    devise_for :users

    post "/save_team" => "users#save_teams"
    get "/" => "users#homepage"
end

def homepage
    puts "\n ****homepage*****"
    @user = current_user
    @user_team = Team.where(:id => @user[:team_id]).first
    @all_teams = Franchise.all
    @teamsarray = []
    @all_teams.each do |next_team|
        @teamsarray << [next_team.team_name, next_team.id]
    end
end

def save_teams
    puts "\n ****save_teams*****"
    @user = current_user
    ok_params = user_params
    @user.update_attribute(:team_id, ok_params[:team_id])
    redirect_to "/"
end

<%= form_with url: "/save_team" do |form| %>
    <%= form.select(:team_id, options_for_select(@teamsarray)) %> <br />
    <%= form.submit %>
<% end %>

<% if @user_team %>
    <p>
    <span>Your team: </span>
    <span><%= @user_team[:team_name] %></span>
    </p>
<% end %>

<% form_with url: "/show_games" do |form| %>
    <% form.select(:week)




# def homepage
#   @user = current_user
#   @teams = Team.all
#   @teamsarray = []
#   @teams.each do |team|
#       @teamsarray << [team.team_name, team.id]
#   end
# end
#
# def save_teams
#     puts "\n *****save_teams****"
#     puts "\n*****params.inspect, #{params.inspect} *******"
#     @user = current_user
#     ok_params = user_params[:team_id]
#     puts "\n *****ok_params.inspect, #{ok_params.inspect}****"
#     @user.update_attribute(:team_id, ok_params[:team_id])
# end

@user_scores = SportsTestTable.where(:id => @weeks[:week]).first
puts "\n ******@user_scores, #{user_scores}"

#   puts "\n ***** display_weekly_data ******"
#   puts "\n ***** params.inspect, #{params.inspect} ******"
#   ok_params = week_params
#   puts "\n *****ok_params[:week], #{ok_params[:week].inspect} ******"
#   @currentweek = SportsTestTable.where(week:ok_params[:week])
#   puts "\n*****@currentweek.length.inspect, #{@currentweek.length.inspect}"
  #
#   @currentweek.each do |game|
#       puts "\n*****@game[:away_team].inspect, #{@game[:away_team].inspect}"


<p>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <p align="center">
    <b>2016 NFL Scoreboard</b>
</p>
    <br>
    <br>
    <br>
    <br>
    <br>
    <%= @nfl_data['weeks'][0]['games'][0]['away']['name'] %> <br>
    <%= @nfl_data['weeks'][0]['games'][0]['scoring']['away_points'] %> <br>
    <%= @nfl_data['weeks'][0]['games'][0]['home']['name'] %> <br>
    <%= @nfl_data['weeks'][0]['games'][0]['scoring']['home_points'] %>
</p>
