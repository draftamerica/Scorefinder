class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # include NFL

  def homepage
      puts "\n ****homepage*****"
      @user = current_user
      @user_team = Team.where(:id => @user[:team_id]).first
      @all_teams = Team.all
      @teamsarray = []
      @all_teams.each do |next_team|
          @teamsarray << [next_team.team_name, next_team.id]
      end

      @weeks = Scoreboard.select("Week")
      puts "\n*****@weeks.length, #{@weeks.length}"
      @weeksarray = []
      puts "\n*****@weeks.inspect, #{@weeks.inspect}"
      @weeks.each do |week|
        #   puts "\n*****week.inspect, #{week.inspect}"
          @weeksarray << week.week
      end
      @weeksarray.uniq
    #   puts "\n*****@weeksarray.inspect, #{@weeksarray.inspect}"
  end

  # def get_weekly_data
  #     puts "\n ***** get_weekly_data ******"
  #     puts "\n ***** params.inspect, #{params.inspect} ******"
  #     ok_params = week_params
  #     puts "\n *****ok_params[:week], #{ok_params[:week].inspect} ******"
  #     @currentweek = Scoreboard.where(:away_team, ok_params[:away_team])
  #     puts "\n*****@currentweek.length.inspect, #{@currentweek.length.inspect}"
  #
  #     @currentweek.each do |game|
  #         puts "\n*****@game[:away_team].inspect, #{@game[:away_team].inspect}"
  #   end
  #
  #     render "display_weekly_data"
  #   end

  def view_team
      puts "\n**** view_team ******"
      puts "\n ***** params.inspect, #{params.inspect} ******"
      @currentteam = Team.find(params[:team_id])
      @team_id = params[:team_id]
      puts "\n ****** @logo, #{@logo.inspect}"
  end

  def view_game
      puts "\n**** view_game ******"
      puts "\n ***** params.inspect, #{params.inspect} ******"
      @currentgame = Scoreboard.find(params[:scoreboard_id])
      @comments = Comment.where(scoreboard_id: params[:scoreboard_id])
      @comment = Comment.new
      @scoreboard_id = params[:scoreboard_id]
      if @currentgame[:away_team] == "San Diego Chargers"
          awayteam = "Los Angeles Chargers"
      else
          awayteam = @currentgame[:away_team]
      end
      if @currentgame[:home_team] == "San Diego Chargers"
          hometeam = "Los Angeles Chargers"
      else
          hometeam = @currentgame[:home_team]
      end
      @team = Team.where(team_name: [awayteam])
      @team2 = Team.where(team_name: [hometeam])

      @awaytm = Team.where(team_name:awayteam)
      @hometm = Team.where(team_name:hometeam)
      @whichweek = session[:week_id]
      puts "\n ******* @whichweek, #{@whichweek.inspect}"

    #   @whichweek = Scoreboard.find(params[:week])
      puts "\n ******* @awaytm, #{@awaytm.inspect}"
      puts "\n ******* @hometm, #{@hometm.inspect}"
      puts "\n ******* @awaytm[0][:abbr], #{@awaytm[0][:abbr].inspect}"
    #   puts "\n ******* @whichweek, #{@whichweek.inspect}"

      @game_stats = get_stats(@awaytm[0][:abbr], @hometm[0][:abbr], @whichweek)
      @player_stats = get_players(@awaytm[0][:abbr], @hometm[0][:abbr], @whichweek)

    #   puts "\n *****@player stats, #{@player_stats['home_team']['statistics']['third_down_efficiency'].inspect}"
    #   puts "\n *****@player stats, #{@player_stats['home_team']['statistics']['rushing']['players'][0]['name'].inspect}"
    #   puts "\n *****TESTING!!!!!****, #{@player_stats['away_team']['statistics']['rushing']['players']['name'].inspect}"
      puts "\n ****@game_stats, #{@game_stats.inspect}"
    #   puts "\n*****TESTING-1-2-3!!!!, #{@player_stats['away_team']['statistics']['rushing']['players'].inspect}"
      @rushingaway = @player_stats['away_team']['statistics']['rushing']['players']
      @rushinghome = @player_stats['home_team']['statistics']['rushing']['players']
      @passingaway = @player_stats['away_team']['statistics']['passing']['players']
      @passinghome = @player_stats['home_team']['statistics']['passing']['players']
      puts "\n*****TESTING 1-2-3!!!!, #{@rushingaway[0..10].inspect}"
      puts "\n*****TESTING 1-2-3!!!!, #{@rushinghome.inspect}"
      puts "\n*****TESTING 1-2-3!!!!, #{@passingaway.inspect}"
      puts "\n*****TESTING 1-2-3!!!!, #{@passinghome.inspect}"
      puts "\n*****TESTING 1-2-3!!!!, #{@player_stats['away_team']['statistics']['passing']['team']['yds'].inspect}"
      puts "\n*****TESTING 1-2-3!!!!, #{@player_stats['away_team']['statistics']['rushing']['team']['yds'].inspect}"
      puts "\n*****TESTING 1-2-3!!!!, #{@player_stats['away_team']['statistics']['first_downs']['team'].inspect}"
    #   puts "\n*****TESTING 1-2-3!!!!, #{@player_stats['away_team']['statistics']['fourth_down_efficiency'].inspect}"
    #   puts "\n*****tEaM sTaTs!-!-!-!,
    #   puts "\n*****TESTING 1-2-3!!!!, #{@player_stats['away_team']['statistics']['third_down_efficiency'].inspect}"
    #   puts "\n*****TESTING 1-2-3!!!!, #{@player_stats['away_team']['statistics']['third_down_efficiency'].inspect}"
    #   puts "\n*****C'MON MAN!!!!!!!!!!, #{@player_stats['away_team']['statistics']['rushing']['players'].inspect}"
    #   puts "\n*****TESTING-1-2-3!!!!, #{@player_stats['away_team']['statistics']['rushing']['players'][1]['name'].inspect}"
    #   puts "\n ****@game_stats===== METHOD!+=====, #{@game_stats['scoring_drives'][0]['scores'][0]['summary'].inspect}"
  end

  def display_weekly_data
      puts "\n ***** display_weekly_data ******"
      puts "\n ***** params.inspect, #{params.inspect} ******"
      puts "\n *****week_params[:week], #{week_params[:week].inspect} ******"
      @currentweek = Scoreboard.where(week: week_params[:week])
      session[:week_id] = week_params[:week]
      puts "\n*****@currentweek.length.inspect, #{@currentweek.length.inspect}"
      @weekpick = week_params[:week]
      puts "\n****** @weekpick.inspect, #{@weekpick.inspect}"

    #   @currentweek.each do |game|
    #     #   puts "\n*****game[:away_team].inspect, #{game[:away_team].inspect}"
    #   end
end

  def save_teams
      puts "\n ****save_teams*****"
      @user = current_user
      @user.update_attribute(:team_id, user_params[:team_id])
      redirect_to "/"
  end

  def get_stats(awaytm, hometm, whichweek)
      puts "\n ****get_stats*****"
      base_url = "https://api.sportradar.us/nfl-"
      access_level = "t"
      version = 1
      year = 2016
      nfl_season = "REG"
      week = whichweek
      away_team = awaytm
      home_team = hometm
      format = "json"

      nfl_url = base_url
      nfl_url += access_level
      nfl_url += version.to_s + "/"
      nfl_url += year.to_s + "/"
      nfl_url += nfl_season.to_s + "/"
      nfl_url += week.to_s + "/"
      nfl_url += away_team + "/"
      nfl_url += home_team + "/boxscore."
      nfl_url += format + "?api_key="
      nfl_url += "rjj2gdr6y9fmrunqqx6fnpct"
      puts "\*****nfl_url, #{nfl_url.inspect}"
      game_stats = NFL.get_nfl_data(nfl_url)
      return game_stats
  end

  def get_players(awaytm, hometm, whichweek)
      puts "\n ****get_players*****"
      base_url = "https://api.sportradar.us/nfl-"
      access_level = "t"
      version = 1
      year = 2016
      nfl_season = "REG"
      week = whichweek
      away_team = awaytm
      home_team = hometm
      format = "json"

      nfl_url = base_url
      nfl_url += access_level
      nfl_url += version.to_s + "/"
      nfl_url += year.to_s + "/"
      nfl_url += nfl_season.to_s + "/"
      nfl_url += week.to_s + "/"
      nfl_url += away_team + "/"
      nfl_url += home_team + "/statistics."
      nfl_url += format + "?api_key="
      nfl_url += "2k82hqcedjp8uf9cksbbx773"
      puts "\*****nfl_url, #{nfl_url.inspect}"
      game_stats = NFL.get_nfl_data(nfl_url)
      return game_stats
  end

  def get_nfl_data
      puts "/n*****get_nfl_data*****"

# https://api.sportradar.us/nfl-{access_level}{version}/league/{year}/{month}/{day}/changes.{format}?api_key={your_api_key}
# https://api.sportradar.us/nfl-{access_level}{version}/games/{year}/{nfl_season}/schedule.{format}?api_key={your_api_key}
# https://api.sportradar.us/nfl-ot2/games/2016/REG/schedule.json?api_key=2k82hqcedjp8uf9cksbbx773

        base_url = "https://api.sportradar.us/nfl-"
        access_level = "ot"
        version = 2
        year = 2016
        nfl_season = "REG"
        format = "json"

        nfl_url = base_url
        nfl_url += access_level
        nfl_url += version.to_s + "/games/"
        nfl_url += year.to_s + "/"
        nfl_url += nfl_season + "/schedule."
        nfl_url += format + "?api_key="
        nfl_url += NFL_key
        @nfl_data = NFL.get_nfl_data(nfl_url)

        @nfl_data['weeks'].each do |week|
            # puts "/n******* week: #{week}"
            week['games'].each do |game|
                # puts "\n ******* game: #{game}"
                team_values = {
                    "week" => week['title'],
                    "away_team" => game['away']['name'],
                    "home_team" => game['home']['name'],
                    "away_points" => game['scoring']['away_points'],
                    "home_points" => game['scoring']['home_points'],
                }
                puts "\n ****team_values, #{team_values}****"

                @scoreboard = Scoreboard.new(team_values)

            end
        end
    end

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.fetch(:team, {})
    end

    def user_params
        puts "\n******* user_params *******"
        params.permit(:team_id)
        # puts "\n*****params.inspect, #{params.inspect}"
        # params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end

    def week_params
        puts "\n******* week_params *******"
        params.permit(:week)
    end

end
