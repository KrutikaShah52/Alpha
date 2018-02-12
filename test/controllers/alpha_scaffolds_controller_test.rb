require 'test_helper'

class AlphaScaffoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alpha_scaffold = alpha_scaffolds(:one)
  end

  test "should get index" do
    get alpha_scaffolds_url
    assert_response :success
  end

  test "should get new" do
    get new_alpha_scaffold_url
    assert_response :success
  end

  test "should create alpha_scaffold" do
    assert_difference('AlphaScaffold.count') do
      post alpha_scaffolds_url, params: { alpha_scaffold: { descreption: @alpha_scaffold.descreption, title: @alpha_scaffold.title } }
    end

    assert_redirected_to alpha_scaffold_url(AlphaScaffold.last)
  end

  test "should show alpha_scaffold" do
    get alpha_scaffold_url(@alpha_scaffold)
    assert_response :success
  end

  test "should get edit" do
    get edit_alpha_scaffold_url(@alpha_scaffold)
    assert_response :success
  end

  test "should update alpha_scaffold" do
    patch alpha_scaffold_url(@alpha_scaffold), params: { alpha_scaffold: { descreption: @alpha_scaffold.descreption, title: @alpha_scaffold.title } }
    assert_redirected_to alpha_scaffold_url(@alpha_scaffold)
  end

  test "should destroy alpha_scaffold" do
    assert_difference('AlphaScaffold.count', -1) do
      delete alpha_scaffold_url(@alpha_scaffold)
    end

    assert_redirected_to alpha_scaffolds_url
  end
end
