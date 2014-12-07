require 'test_helper'

class AlbumRatingsControllerTest < ActionController::TestCase
  setup do
    @album_rating = album_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_rating" do
    assert_difference('AlbumRating.count') do
      post :create, album_rating: { album_id: @album_rating.album_id, score: @album_rating.score, user_id: @album_rating.user_id }
    end

    assert_redirected_to album_rating_path(assigns(:album_rating))
  end

  test "should show album_rating" do
    get :show, id: @album_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_rating
    assert_response :success
  end

  test "should update album_rating" do
    patch :update, id: @album_rating, album_rating: { album_id: @album_rating.album_id, score: @album_rating.score, user_id: @album_rating.user_id }
    assert_redirected_to album_rating_path(assigns(:album_rating))
  end

  test "should destroy album_rating" do
    assert_difference('AlbumRating.count', -1) do
      delete :destroy, id: @album_rating
    end

    assert_redirected_to album_ratings_path
  end
end
