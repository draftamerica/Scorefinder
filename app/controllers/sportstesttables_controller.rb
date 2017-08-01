class SportstesttablesController < ApplicationController
  before_action :set_sports_test_table, only: [:show, :edit, :update, :destroy]

  include NFL

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

        # test_data = @nfl_data['weeks'][0]['games'][0]
        #     puts "\n ****test_data, #{test_data}****"
        # test_data_2 = @nfl_data['weeks'][0]['games'][0]['away']['name']
        #     puts "\n ****test_data_2, #{test_data_2}****"


        # test_values = {
        #     "week" => 0,
        #     "away_team" => test_data_2,
        #     "home_team" => "",
        #     "away_points" => 0,
        #     "home_points" => 0
        # }
        # render "sports_test_tables/index.html.erb"
  end

  # GET /sports_test_tables
  # GET /sports_test_tables.json
  def index
    @sports_test_tables = SportsTestTable.all
  end

  # GET /sports_test_tables/1
  # GET /sports_test_tables/1.json
  def show
  end

  # GET /sports_test_tables/new
  def new
    @sports_test_table = SportsTestTable.new
  end

  # GET /sports_test_tables/1/edit
  def edit
  end

  # POST /sports_test_tables
  # POST /sports_test_tables.json
  def create
    @sports_test_table = SportsTestTable.new(sports_test_table_params)

    respond_to do |format|
      if @sports_test_table.save
        format.html { redirect_to @sports_test_table, notice: 'Sports test table was successfully created.' }
        format.json { render :show, status: :created, location: @sports_test_table }
      else
        format.html { render :new }
        format.json { render json: @sports_test_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports_test_tables/1
  # PATCH/PUT /sports_test_tables/1.json
  def update
    respond_to do |format|
      if @sports_test_table.update(sports_test_table_params)
        format.html { redirect_to @sports_test_table, notice: 'Sports test table was successfully updated.' }
        format.json { render :show, status: :ok, location: @sports_test_table }
      else
        format.html { render :edit }
        format.json { render json: @sports_test_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports_test_tables/1
  # DELETE /sports_test_tables/1.json
  def destroy
    @sports_test_table.destroy
    respond_to do |format|
      format.html { redirect_to sports_test_tables_url, notice: 'Sports test table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sports_test_table
      @sports_test_table = SportsTestTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sports_test_table_params
      params.fetch(:sports_test_table, {})
    end
end
