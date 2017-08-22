class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  include NFL

  def homepage
      puts "\n ****homepage*****"
      @user = current_user
      @user_team = Team.where(:id => @user[:team_id]).first
      @all_teams = Team.all
      @teamsarray = []
      @all_teams.each do |next_team|
          @teamsarray << [next_team.team_name, next_team.id]
      end

      @weeks = SportsTestTable.select("Week")
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

  def get_weekly_data
      puts "\n ***** display_weekly_data ******"
      puts "\n ***** params.inspect, #{params.inspect} ******"
      ok_params = week_params
      puts "\n *****ok_params[:week], #{ok_params[:week].inspect} ******"
      @currentweek = SportsTestTable.where(:away_team, ok_params[:away_team])
      puts "\n*****@currentweek.length.inspect, #{@currentweek.length.inspect}"

      @currentweek.each do |game|
          puts "\n*****@game[:away_team].inspect, #{@game[:away_team].inspect}"
    end

      redirect_to "/display_weekly_data"
    end

  def display_weekly_data
      puts "\n ***** display_weekly_data ******"
      puts "\n ***** params.inspect, #{params.inspect} ******"
      ok_params = week_params
      puts "\n *****ok_params[:week], #{ok_params[:week].inspect} ******"
      @currentweek = SportsTestTable.where(:away_team, ok_params[:away_team])
      puts "\n*****@currentweek.length.inspect, #{@currentweek.length.inspect}"

      @currentweek.each do |game|
          puts "\n*****@game[:away_team].inspect, #{@game[:away_team].inspect}"
    end
end

  def save_teams
      puts "\n ****save_teams*****"
      @user = current_user
      ok_params = user_params
      @user.update_attribute(:team_id, ok_params[:team_id])
      redirect_to "/"
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

                @sports_test_table = SportsTestTable.new(team_values)
                @sports_test_table.save

            end
        end
    end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      params.require(:user).permit(:team_id, :save_teams, :commit)
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
