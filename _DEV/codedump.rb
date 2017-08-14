<div class="scoring">
<% @game_stats['away_team']['scoring'].each do |quarter| %>
    <div id="quarter">
        <%= quarter['quarter'] %>
    </div>
    <div id="points">
        <%= quarter['points'] %>
    </div>
<% end %>

https://api.sportradar.us/nfl-t1/2016/REG/1/MIN/TEN/boxscore.json?api_key=2k82hqcedjp8uf9cksbbx773

{"id":"3b1521d9-ec2c-48e9-b695-c493e65470b1","scheduled":"2016-09-11T17:00:00+00:00","status":"closed","completed":"2016-09-11T20:01:57+00:00","quarter":4,"clock":":00","home_team":
    {"id":"TEN","name":"Titans","market":"Tennessee","remaining_challenges":2,"remaining_timeouts":2,"points":16,"scoring":
        [
            {"quarter":1,"points":3},{"quarter":2,"points":7},{"quarter":3,"points":0},{"quarter":4,"points":6}]},
            "away_team":{"id":"MIN","name":"Vikings","market":"Minnesota","remaining_challenges":2,"remaining_timeouts":2,"points":25,
                "scoring":[{"quarter":1,"points":0},{"quarter":2,"points":0},{"quarter":3,"points":12},{"quarter":4,"points":13}]},
            "scoring_drives":[{"sequence":1,"clock":"09:09","quarter":1,"team":"TEN","scores":
                [{"id":"952d495f-e2c1-4778-8787-34c4a4d1d8c4","type":"fieldgoal","clock":"04:50","team":"TEN","quarter":1,"points":3,"summary":"4-R.Succop 28 yards Field Goal is Good."}]},{"sequence":2,"clock":"04:55","quarter":2,"team":"TEN","scores":[{"id":"d11853a4-6a99-4d65-a39e-721e7c69d074","type":"touchdown","clock":":47","team":"TEN","quarter":2,"points":6,"summary":"8-M.Mariota complete to 29-D.Murray. 29-D.Murray runs 6 yards for a touchdown."},{"id":"09494569-f881-48ad-8868-e058e12a4757","type":"extrapoint","clock":":41","team":"TEN","quarter":2,"points":1,"summary":"4-R.Succop extra point is good."}]},{"sequence":3,"clock":"15:00","quarter":3,"team":"MIN","scores":[{"id":"b5263d81-e4b2-4557-b085-266bd0e64a0e","type":"fieldgoal","clock":"14:01","team":"MIN","quarter":3,"points":3,"summary":"3-B.Walsh 50 yards Field Goal is Good."}]},{"sequence":4,"clock":"11:30","quarter":3,"team":"MIN","scores":[{"id":"d12c13fe-4899-47ca-996a-59c4c8ef6ce6","type":"fieldgoal","clock":"06:08","team":"MIN","quarter":3,"points":3,"summary":"3-B.Walsh 33 yards Field Goal is Good."}]},{"sequence":5,"clock":"05:59","quarter":3,"team":"TEN","scores":[{"id":"7b4aab7a-b158-4b12-84ff-27e5c953ab9c","type":"touchdown","clock":"01:38","team":"MIN","quarter":3,"points":6,"summary":"8-M.Mariota incomplete. Intended for 83-H.Douglas, INTERCEPTED by 54-E.Kendricks at MIN 23. 54-E.Kendricks runs 77 yards for a touchdown."}]},{"sequence":6,"clock":":22","quarter":3,"team":"MIN","scores":[{"id":"76d5760a-57ef-4568-a178-00194e5c81ad","type":"fieldgoal","clock":"11:22","team":"MIN","quarter":4,"points":3,"summary":"3-B.Walsh 45 yards Field Goal is Good."}]},{"sequence":7,"clock":"11:17","quarter":4,"team":"TEN","scores":[{"id":"2370afd0-bc31-4dce-8c7d-8dc1583be1c1","type":"touchdown","clock":"11:11","team":"MIN","quarter":4,"points":6,"summary":"8-M.Mariota FUMBLES (Aborted) at TEN 24. 99-D.Hunter recovers at the TEN 24. 99-D.Hunter runs 24 yards for a touchdown."}]},{"sequence":8,"clock":"11:03","quarter":4,"team":"MIN","scores":[{"id":"f4aa01d9-b57e-4275-a91d-c14d7fa819a2","type":"extrapoint","clock":"11:03","team":"MIN","quarter":4,"points":1,"summary":"3-B.Walsh extra point is good."}]},{"sequence":9,"clock":"07:09","quarter":4,"team":"MIN","scores":[{"id":"e3cbbdb1-9c08-4ae7-bf14-925b5e55a4d2","type":"fieldgoal","clock":"02:41","team":"MIN","quarter":4,"points":3,"summary":"3-B.Walsh 30 yards Field Goal is Good."}]},{"sequence":10,"clock":"02:36","quarter":4,"team":"TEN","scores":[{"id":"b25c7c70-f0dc-484d-b4bd-0be8e1352b35","type":"touchdown","clock":":32","team":"TEN","quarter":4,"points":6,"summary":"8-M.Mariota complete to 29-D.Murray. 29-D.Murray runs 4 yards for a touchdown."}]}]}
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

<!-- <img src="<% @team[:logo]%>"> -->


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
