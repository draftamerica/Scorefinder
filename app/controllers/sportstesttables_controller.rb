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
        puts "*******+++ nfl_url.inspect, #{nfl_url.inspect}*****"
        # puts "******@nfl_data.inspect, #{@nfl_data.inspect}"
        # puts "******@nfl_data['weeks'][0].inspect, #{@nfl_data['weeks'][0].inspect}"
        # puts "******@nfl_data['weeks'][0]['games'].inspect, #{@nfl_data['weeks'][0]['games'].inspect}"
        # puts "******@nfl_data['weeks'][0]['games'][0].inspect, #{@nfl_data['weeks'][0]['games'][0].inspect}"
        # puts "******...['home']['name'].inspect, #{@nfl_data['weeks'][0]['games'][0]['home']['name'].inspect}"
        puts "******...['home']['name'].inspect, #{@nfl_data['weeks'][0]['games'][0]['home']['name'].inspect}"
        puts "******...['scoring'].inspect, #{@nfl_data['weeks'][0]['games'][0]['scoring'].inspect}"
        puts "******...['scoring']['home_points'].inspect, #{@nfl_data['weeks'][0]['games'][0]['scoring']['home_points'].inspect}"
        puts "******...['scoring']['away_points'].inspect, #{@nfl_data['weeks'][0]['games'][0]['scoring']['away_points'].inspect}"
        # puts "******@nfl_data.inspect, #{@nfl_data.inspect}"
        # puts "******@nfl_data.inspect, #{@nfl_data.inspect}"
        render "get_nfl_data_form"
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
