require 'test_helper'

class EmailUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_user = email_users(:one)
  end

  test "should get index" do
    get email_users_url
    assert_response :success
  end

  test "should get new" do
    get new_email_user_url
    assert_response :success
  end

  test "should create email_user" do
    assert_difference('EmailUser.count') do
      post email_users_url, params: { email_user: { email: @email_user.email, login: @email_user.login, name: @email_user.name } }
    end

    assert_redirected_to email_user_url(EmailUser.last)
  end

  test "should show email_user" do
    get email_user_url(@email_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_user_url(@email_user)
    assert_response :success
  end

  test "should update email_user" do
    patch email_user_url(@email_user), params: { email_user: { email: @email_user.email, login: @email_user.login, name: @email_user.name } }
    assert_redirected_to email_user_url(@email_user)
  end

  test "should destroy email_user" do
    assert_difference('EmailUser.count', -1) do
      delete email_user_url(@email_user)
    end

    assert_redirected_to email_users_url
  end
end
