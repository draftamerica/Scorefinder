<div class="scoring">
<% @game_stats['away_team']['scoring'].each do |quarter| %>
    <div id="quarter">
        <%= quarter['quarter'] %>
    </div>
    <div id="points">
        <%= quarter['points'] %>
    </div>
<% end %>

<div class="passingstats">
    <p>Individual Passing Stats</p>
    <p>Player</p>
    <%= @player_stats['away_team']['statistics']['passing']['players'].each do |passing| %>
        <%= passing['name'] %>: &nbsp;
        <%= passing['cmp'] %> -
        <%= passing['att'] %> -
        <%= passing['int'] %> -
        <%= passing['yds'] %>,&nbsp;
        <%= passing['td'] %> TD <br>
    <% end %>
</div>
<br>

<div class="passingstats">
    <p>Individual Passing Stats</p>
    <p>Player</p>
    <%= @player_stats['home_team']['statistics']['passing']['players'].each do |passing| %>
        <%= passing['name'] %>: &nbsp;
        <%= passing['cmp'] %> -
        <%= passing['att'] %> -
        <%= passing['int'] %> -
        <%= passing['yds'] %>,&nbsp;
        <%= passing['td'] %> TD <br>
    <% end %>
</div>
<br>


<div class="rushingstats">
    <p>Individual Rushing Stats<p>
    <p>Player</p>
    <%= @rushingaway.each do |rushing| %>
        <%= rushing['name'] %>: &nbsp;
        <%= rushing['att'] %> -
        <%= rushing['yds'] %>, &nbsp;
        <%= rushing['td'] %> TD <br>
    <% end %>
</div>
<br>

<div class="rushingstats">
    <p>Individual Rushing Stats<p>
    <p>Player (Attempts-Yards, TD)</p>
    <%= @player_stats['home_team']['statistics']['rushing']['players'].each do |rushing| %>
        <%= rushing['name'] %>: &nbsp;
        <%= rushing['att'] %> -
        <%= rushing['yds'] %>, &nbsp;
        <%= rushing['td']%><br>
    <% end %>
</div>


<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>

<div class="rushingstats">
    <p>Individual Rushing Stats<p>
    <p>Player</p>
    <%= @rushingaway.each do |rushing| %>
        <%= rushing['name'] %>: &nbsp;
        <%= rushing['att'] %> -
        <%= rushing['yds'] %>, &nbsp;
        <%= rushing['td'] %> TD <br>
    <% end %>
</div>


https://api.sportradar.us/nfl-t1/2016/REG/1/MIN/TEN/boxscore.json?api_key=2k82hqcedjp8uf9cksbbx773


#WORKS FOR MIN-TEN
<div class="scoringsummary">
    <%= @game_stats['scoring_drives'][0]['scores'][0]['summary'] %>
    <%= @game_stats['scoring_drives'][1]['scores'][0]['summary'] %>
    <%= @game_stats['scoring_drives'][1]['scores'][1]['summary'] %>
</div>

<%= @player_stats['home_team']['statistics'].each do |players| %>
    <%= players['name'] %>
<% end %>




{"id":"3b1521d9-ec2c-48e9-b695-c493e65470b1","scheduled":"2016-09-11T17:00:00+00:00","status":"closed","home_team":
    {"id":"TEN","name":"Titans","market":"Tennessee","remaining_challenges":2,"remaining_timeouts":2,"points":16,"statistics":
        {"two_point_conversion":{"team":{"att":1,"pass":0,"rush":0,"rec":0,"failed":1},"players":
        [
            {"id":"7c16c04c-04de-41f3-ac16-ad6a9435e3f7","name":"Marcus Mariota","jersey":8,"position":"QB","att":1,"pass":0,"rush":0,"rec":0}]},
        "touchdowns":
                {"team":
                    {"pass":2,"rush":0,"int":0,"fum_ret":0,"punt_ret":0,"kick_ret":0,"fg_ret":0,"other":0},"players":
                        [
                            {"id":"478ae115-d220-424e-af45-56137f163d3a","name":"DeMarco Murray","jersey":29,"position":"RB","pass":2,"rush":0,"int":0,"fum_ret":0,"punt_ret":0,"kick_ret":0,"fg_ret":0,"other":0}]},"third_down_efficiency":
                                {"team":
                                    {"att":14,"conv":8,"pct":57.143,"pass":7,"rush":1,"pen":0}},"rushing":{"team":{"att":22,"yds":64,"avg":2.909,"lg":12,"td":0,"fd":2,"fd_pct":9.091,"sfty":0,"rz_att":2,"fum":1,"yds_10_pls":2,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},"players":[{"id":"87c481c7-7414-43cc-82df-19ca0c2ae22e","name":"Derrick Henry","jersey":22,"position":"RB","att":5,"yds":3,"avg":0.6,"lg":5,"td":0,"fd":0,"fd_pct":0.0,"sfty":0,"rz_att":0,"fum":0,"yds_10_pls":0,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},{"id":"7c16c04c-04de-41f3-ac16-ad6a9435e3f7","name":"Marcus Mariota","jersey":8,"position":"QB","att":4,"yds":19,"avg":4.75,"lg":10,"td":0,"fd":1,"fd_pct":25.0,"sfty":0,"rz_att":1,"fum":0,"yds_10_pls":1,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},{"id":"478ae115-d220-424e-af45-56137f163d3a","name":"DeMarco Murray","jersey":29,"position":"RB","att":13,"yds":42,"avg":3.231,"lg":12,"td":0,"fd":1,"fd_pct":7.692,"sfty":0,"rz_att":1,"fum":1,"yds_10_pls":1,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0}]},"redzone_efficiency":{"team":{"att":3,"td":2,"pct":66.667}},"receiving":{"team":{"tar":41,"rec":25,"yds":271,"yac":271,"fd":16,"avg":10.84,"td":2,"lg":29,"rz_tar":7,"fum":0,"yds_10_pls":10,"yds_20_pls":2,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},"players":[{"id":"87c481c7-7414-43cc-82df-19ca0c2ae22e","name":"Derrick Henry","jersey":22,"position":"RB","tar":2,"rec":2,"yds":41,"yac":41,"fd":2,"avg":20.5,"td":0,"lg":29,"rz_tar":0,"fum":0,"yds_10_pls":1,"yds_20_pls":1,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},{"id":"478ae115-d220-424e-af45-56137f163d3a","name":"DeMarco Murray","jersey":29,"position":"RB","tar":7,"rec":5,"yds":35,"yac":35,"fd":3,"avg":7.0,"td":2,"lg":14,"rz_tar":3,"fum":0,"yds_10_pls":1,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},{"id":"969a4d68-1d76-4e64-bfff-e898a9ac6bd4","name":"Rishard Matthews","jersey":18,"position":"WR","tar":4,"rec":3,"yds":26,"yac":26,"fd":1,"avg":8.667,"td":0,"lg":11,"rz_tar":1,"fum":0,"yds_10_pls":1,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},{"id":"848b34eb-1ca8-435c-a805-957aa71d4883","name":"Andre Johnson","jersey":81,"position":"WR","tar":7,"rec":3,"yds":30,"yac":30,"fd":1,"avg":10.0,"td":0,"lg":16,"rz_tar":0,"fum":0,"yds_10_pls":1,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},{"id":"ccce5e8e-52ca-4f0f-a40f-fe5e7227d156","name":"Delanie Walker","jersey":82,"position":"TE","tar":5,"rec":3,"yds":42,"yac":42,"fd":2,"avg":14.0,"td":0,"lg":26,"rz_tar":1,"fum":0,"yds_10_pls":1,"yds_20_pls":1,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},{"id":"e4ba7c28-6942-411e-a528-1dc1a8a8ccc7","name":"Harry Douglas","jersey":83,"position":"WR","tar":5,"rec":2,"yds":21,"yac":21,"fd":2,"avg":10.5,"td":0,"lg":16,"rz_tar":1,"fum":0,"yds_10_pls":1,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},{"id":"b4e5a9af-6d00-4d51-9bb9-c7d5f69898df","name":"Tajae Sharpe","jersey":19,"position":"WR","tar":11,"rec":7,"yds":76,"yac":76,"fd":5,"avg":10.857,"td":0,"lg":17,"rz_tar":1,"fum":0,"yds_10_pls":4,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0}]},"punting":{"team":{"punts":5,"yds":231,"net_yds":192,"lg":64,"blk":0,"in20":1,"tb":1,"ret":5,"sfty":0,"avg":46.2,"net_avg":38.4,"ret_yds":19,"avg_ret":3.8,"in20_pct":20.0,"tb_pct":20.0},"players":[{"id":"9aec0e35-cef7-4093-8de6-49868ca8644b","name":"Brett Kern","jersey":6,"position":"P","punts":5,"yds":231,"net_yds":192,"lg":64,"blk":0,"in20":1,"tb":1,"ret":5,"sfty":0,"avg":46.2,"net_avg":38.4,"ret_yds":19,"avg_ret":3.8,"in20_pct":20.0,"tb_pct":20.0}]},"punt_return":{"team":{"returns":1,"yds":14,"fc":2,"lg":14,"td":0,"avg":14.0,"yds_10_pls":1,"yds_20_pls":0,"yds_30_pls":0,"yds_40_pls":0,"yds_50_pls":0},"players":[{"id":"1bf13fc6-cf27-4b22-ad99-2c72eedd37a6",


"scoring_drives":
    [
        {"sequence":1,"clock":"09:09","quarter":1,"team":"TEN","scores":
            [
                {"id":"952d495f-e2c1-4778-8787-34c4a4d1d8c4","type":"fieldgoal","clock":"04:50","team":"TEN","quarter":1,"points":3,"summary":"4-R.Succop 28 yards Field Goal is Good."}]},
                {"sequence":2,"clock":"04:55","quarter":2,"team":"TEN","scores":[{"id":"d11853a4-6a99-4d65-a39e-721e7c69d074","type":"touchdown","clock":":47","team":"TEN","quarter":2,"points":6,"summary":"8-M.Mariota complete to 29-D.Murray. 29-D.Murray runs 6 yards for a touchdown."},{"id":"09494569-f881-48ad-8868-e058e12a4757","type":"extrapoint","clock":":41","team":"TEN","quarter":2,"points":1,"summary":"4-R.Succop extra point is good."}]},{"sequence":3,"clock":"15:00","quarter":3,"team":"MIN","scores":[{"id":"b5263d81-e4b2-4557-b085-266bd0e64a0e","type":"fieldgoal","clock":"14:01","team":"MIN","quarter":3,"points":3,"summary":"3-B.Walsh 50 yards Field Goal is Good."}]},{"sequence":4,"clock":"11:30","quarter":3,"team":"MIN","scores":[{"id":"d12c13fe-4899-47ca-996a-59c4c8ef6ce6","type":"fieldgoal","clock":"06:08","team":"MIN","quarter":3,"points":3,"summary":"3-B.Walsh 33 yards Field Goal is Good."}]},{"sequence":5,"clock":"05:59","quarter":3,"team":"TEN","scores":[{"id":"7b4aab7a-b158-4b12-84ff-27e5c953ab9c","type":"touchdown","clock":"01:38","team":"MIN","quarter":3,"points":6,"summary":"8-M.Mariota incomplete. Intended for 83-H.Douglas, INTERCEPTED by 54-E.Kendricks at MIN 23. 54-E.Kendricks runs 77 yards for a touchdown."}]},{"sequence":6,"clock":":22","quarter":3,"team":"MIN","scores":[{"id":"76d5760a-57ef-4568-a178-00194e5c81ad","type":"fieldgoal","clock":"11:22","team":"MIN","quarter":4,"points":3,"summary":"3-B.Walsh 45 yards Field Goal is Good."}]},{"sequence":7,"clock":"11:17","quarter":4,"team":"TEN","scores":[{"id":"2370afd0-bc31-4dce-8c7d-8dc1583be1c1","type":"touchdown","clock":"11:11","team":"MIN","quarter":4,"points":6,"summary":"8-M.Mariota FUMBLES (Aborted) at TEN 24. 99-D.Hunter recovers at the TEN 24. 99-D.Hunter runs 24 yards for a touchdown."}]},{"sequence":8,"clock":"11:03","quarter":4,"team":"MIN","scores":[{"id":"f4aa01d9-b57e-4275-a91d-c14d7fa819a2","type":"extrapoint","clock":"11:03","team":"MIN","quarter":4,"points":1,"summary":"3-B.Walsh extra point is good."}]},{"sequence":9,"clock":"07:09","quarter":4,"team":"MIN","scores":[{"id":"e3cbbdb1-9c08-4ae7-bf14-925b5e55a4d2","type":"fieldgoal","clock":"02:41","team":"MIN","quarter":4,"points":3,"summary":"3-B.Walsh 30 yards Field Goal is Good."}]},{"sequence":10,"clock":"02:36","quarter":4,"team":"TEN","scores":[{"id":"b25c7c70-f0dc-484d-b4bd-0be8e1352b35","type":"touchdown","clock":":32","team":"TEN","quarter":4,"points":6,"summary":"8-M.Mariota complete to 29-D.Murray. 29-D.Murray runs 4 yards for a touchdown."}]}]}


{"id":"3b1521d9-ec2c-48e9-b695-c493e65470b1","scheduled":"2016-09-11T17:00:00+00:00","status":"closed","completed":"2016-09-11T20:01:57+00:00","quarter":4,"clock":":00","home_team":
    {"id":"TEN","name":"Titans","market":"Tennessee","remaining_challenges":2,"remaining_timeouts":2,"points":16,"scoring":
        [
            {"quarter":1,"points":3},{"quarter":2,"points":7},{"quarter":3,"points":0},{"quarter":4,"points":6}]},
            "away_team":{"id":"MIN","name":"Vikings","market":"Minnesota","remaining_challenges":2,"remaining_timeouts":2,"points":25,
                "scoring":
                [
                    {"quarter":1,"points":0},{"quarter":2,"points":0},{"quarter":3,"points":12},{"quarter":4,"points":13}]},
            "scoring_drives":
                    [
                        {"sequence":1,"clock":"09:09","quarter":1,"team":"TEN","scores":
                            [
                                {"id":"952d495f-e2c1-4778-8787-34c4a4d1d8c4","type":"fieldgoal","clock":"04:50","team":"TEN","quarter":1,"points":3,"summary":"4-R.Succop 28 yards Field Goal is Good."}]},{"sequence":2,"clock":"04:55","quarter":2,"team":"TEN","scores":[{"id":"d11853a4-6a99-4d65-a39e-721e7c69d074","type":"touchdown","clock":":47","team":"TEN","quarter":2,"points":6,"summary":"8-M.Mariota complete to 29-D.Murray. 29-D.Murray runs 6 yards for a touchdown."},{"id":"09494569-f881-48ad-8868-e058e12a4757","type":"extrapoint","clock":":41","team":"TEN","quarter":2,"points":1,"summary":"4-R.Succop extra point is good."}]},{"sequence":3,"clock":"15:00","quarter":3,"team":"MIN","scores":[{"id":"b5263d81-e4b2-4557-b085-266bd0e64a0e","type":"fieldgoal","clock":"14:01","team":"MIN","quarter":3,"points":3,"summary":"3-B.Walsh 50 yards Field Goal is Good."}]},{"sequence":4,"clock":"11:30","quarter":3,"team":"MIN","scores":[{"id":"d12c13fe-4899-47ca-996a-59c4c8ef6ce6","type":"fieldgoal","clock":"06:08","team":"MIN","quarter":3,"points":3,"summary":"3-B.Walsh 33 yards Field Goal is Good."}]},{"sequence":5,"clock":"05:59","quarter":3,"team":"TEN","scores":[{"id":"7b4aab7a-b158-4b12-84ff-27e5c953ab9c","type":"touchdown","clock":"01:38","team":"MIN","quarter":3,"points":6,"summary":"8-M.Mariota incomplete. Intended for 83-H.Douglas, INTERCEPTED by 54-E.Kendricks at MIN 23. 54-E.Kendricks runs 77 yards for a touchdown."}]},{"sequence":6,"clock":":22","quarter":3,"team":"MIN","scores":[{"id":"76d5760a-57ef-4568-a178-00194e5c81ad","type":"fieldgoal","clock":"11:22","team":"MIN","quarter":4,"points":3,"summary":"3-B.Walsh 45 yards Field Goal is Good."}]},{"sequence":7,"clock":"11:17","quarter":4,"team":"TEN","scores":[{"id":"2370afd0-bc31-4dce-8c7d-8dc1583be1c1","type":"touchdown","clock":"11:11","team":"MIN","quarter":4,"points":6,"summary":"8-M.Mariota FUMBLES (Aborted) at TEN 24. 99-D.Hunter recovers at the TEN 24. 99-D.Hunter runs 24 yards for a touchdown."}]},{"sequence":8,"clock":"11:03","quarter":4,"team":"MIN","scores":[{"id":"f4aa01d9-b57e-4275-a91d-c14d7fa819a2","type":"extrapoint","clock":"11:03","team":"MIN","quarter":4,"points":1,"summary":"3-B.Walsh extra point is good."}]},{"sequence":9,"clock":"07:09","quarter":4,"team":"MIN","scores":[{"id":"e3cbbdb1-9c08-4ae7-bf14-925b5e55a4d2","type":"fieldgoal","clock":"02:41","team":"MIN","quarter":4,"points":3,"summary":"3-B.Walsh 30 yards Field Goal is Good."}]},{"sequence":10,"clock":"02:36","quarter":4,"team":"TEN","scores":[{"id":"b25c7c70-f0dc-484d-b4bd-0be8e1352b35","type":"touchdown","clock":":32","team":"TEN","quarter":4,"points":6,"summary":"8-M.Mariota complete to 29-D.Murray. 29-D.Murray runs 4 yards for a touchdown."}]}]}
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
