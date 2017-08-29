class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

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
          @weeksarray << week.week
      end
      @weeksarray.uniq
  end

  def view_team
      @currentteam = Team.find(params[:team_id])
      @team_id = params[:team_id]
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
      @users = User.all

      @awaytm = Team.where(team_name:awayteam)
      @hometm = Team.where(team_name:hometeam)
      @whichweek = session[:week_id]
      @game_stats = get_stats(@awaytm[0][:abbr], @hometm[0][:abbr], @whichweek)
      @player_stats = get_players(@awaytm[0][:abbr], @hometm[0][:abbr], @whichweek)
      @rushingaway = @player_stats['away_team']['statistics']['rushing']['players']
      @rushinghome = @player_stats['home_team']['statistics']['rushing']['players']
      @passingaway = @player_stats['away_team']['statistics']['passing']['players']
      @passinghome = @player_stats['home_team']['statistics']['passing']['players']
      @awayyards = (@player_stats['away_team']['statistics']['passing']['team']['yds']) + (@player_stats['away_team']['statistics']['rushing']['team']['yds'])
      @awaypassyards = @player_stats['away_team']['statistics']['passing']['team']['yds']
      @awayrushyards = @player_stats['away_team']['statistics']['rushing']['team']['yds']
      @awayfirstdowns = @player_stats['away_team']['statistics']['first_downs']['team']['num']
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
  end

  def save_teams
      puts "\n ****save_teams*****"
      @user = current_user
      @user.update_attribute(:team_id, user_params[:team_id])
      redirect_to "/"
  end

  def get_nfl_data
    puts "/n*****get_nfl_data*****"
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
    nfl_url += "x2kpv28e8d7pe3cn2qqesk6t"
    @nfl_data = self.get_nfl_data(nfl_url)

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

            @scoreboard = Scoreboard.new(team_values)

            end
        end
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
      nfl_url += "x2kpv28e8d7pe3cn2qqesk6t"
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
      nfl_url += "x2kpv28e8d7pe3cn2qqesk6t"
      puts "\*****nfl_url, #{nfl_url.inspect}"
      game_stats = NFL.get_nfl_data(nfl_url)
      return game_stats
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
