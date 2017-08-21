class SportstesttablesController < ApplicationController
  before_action :set_sports_test_table, only: [:show, :edit, :update, :destroy]

  # include NFL

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
