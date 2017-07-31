require 'test_helper'

class SportsTestTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sports_test_table = sports_test_tables(:one)
  end

  test "should get index" do
    get sports_test_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_sports_test_table_url
    assert_response :success
  end

  test "should create sports_test_table" do
    assert_difference('SportsTestTable.count') do
      post sports_test_tables_url, params: { sports_test_table: {  } }
    end

    assert_redirected_to sports_test_table_url(SportsTestTable.last)
  end

  test "should show sports_test_table" do
    get sports_test_table_url(@sports_test_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_sports_test_table_url(@sports_test_table)
    assert_response :success
  end

  test "should update sports_test_table" do
    patch sports_test_table_url(@sports_test_table), params: { sports_test_table: {  } }
    assert_redirected_to sports_test_table_url(@sports_test_table)
  end

  test "should destroy sports_test_table" do
    assert_difference('SportsTestTable.count', -1) do
      delete sports_test_table_url(@sports_test_table)
    end

    assert_redirected_to sports_test_tables_url
  end
end
