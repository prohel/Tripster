require 'test_helper'

class AttachmentRatingsControllerTest < ActionController::TestCase
  setup do
    @attachment_rating = attachment_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attachment_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attachment_rating" do
    assert_difference('AttachmentRating.count') do
      post :create, attachment_rating: { attachment_id: @attachment_rating.attachment_id, score: @attachment_rating.score, user_id: @attachment_rating.user_id }
    end

    assert_redirected_to attachment_rating_path(assigns(:attachment_rating))
  end

  test "should show attachment_rating" do
    get :show, id: @attachment_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attachment_rating
    assert_response :success
  end

  test "should update attachment_rating" do
    patch :update, id: @attachment_rating, attachment_rating: { attachment_id: @attachment_rating.attachment_id, score: @attachment_rating.score, user_id: @attachment_rating.user_id }
    assert_redirected_to attachment_rating_path(assigns(:attachment_rating))
  end

  test "should destroy attachment_rating" do
    assert_difference('AttachmentRating.count', -1) do
      delete :destroy, id: @attachment_rating
    end

    assert_redirected_to attachment_ratings_path
  end
end
