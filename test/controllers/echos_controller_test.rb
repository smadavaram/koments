require 'test_helper'

class EchosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @echo = echos(:one)
  end

  test "should get index" do
    get echos_url
    assert_response :success
  end

  test "should get new" do
    get new_echo_url
    assert_response :success
  end

  test "should create echo" do
    assert_difference('Echo.count') do
      post echos_url, params: { echo: { body: @echo.body, headline: @echo.headline } }
    end

    assert_redirected_to echo_url(Echo.last)
  end

  test "should show echo" do
    get echo_url(@echo)
    assert_response :success
  end

  test "should get edit" do
    get edit_echo_url(@echo)
    assert_response :success
  end

  test "should update echo" do
    patch echo_url(@echo), params: { echo: { body: @echo.body, headline: @echo.headline } }
    assert_redirected_to echo_url(@echo)
  end

  test "should destroy echo" do
    assert_difference('Echo.count', -1) do
      delete echo_url(@echo)
    end

    assert_redirected_to echos_url
  end
end
