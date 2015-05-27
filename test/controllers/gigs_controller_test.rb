require 'test_helper'

class GigsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  test "index works" do
    sign_in :user, User.find_by_email('test1@test.com')
    get :index
    assert_response :success
    assert_not_nil assigns(:gigs)
  end

  test "show works" do
    sign_in :user, User.find_by_email('test1@test.com')
    get(:show, {id:'1'})
    assert_response :success
    assert_not_nil assigns(:gig)
  end

  test "new works" do
    sign_in :user, User.find_by_email('test1@test.com')
    get :new
    assert_response :success
    assert_not_nil assigns(:gig)
  end

  test "edit works" do
    sign_in :user, User.find_by_email('test1@test.com')
    get :edit, {id:'1'}
    assert_response :success
    assert_not_nil assigns(:gig)
  end

  test "create works" do
    sign_in :user, User.find_by_email('test1@test.com')
    assert_difference('Gig.count') do
      post :create, gig: {name:'some name', location:'some location', date: '2015-01-01'}
    end
    gig = assigns(:gig)
    assert_not_nil gig
    assert_redirected_to gig_path(gig)
    gig = Gig.find(gig.id)
    assert_equal 'some name', gig.name
    assert_equal 'some location', gig.location
    assert_equal Date.parse('2015-01-01'), gig.date
  end

  test "invalid create parameters works" do
    sign_in :user, User.find_by_email('test1@test.com')
    assert_no_difference('Gig.count') do
      post :create, gig:{name:'some name'}
    end
    assert_not_nil assigns(:gig)
    assert_template :new
  end

  test "update works" do
    sign_in :user, User.find_by_email('test1@test.com')
    put :update, id:'1', gig: {name:'some name', location:'some location', date: '2015-01-01'}
    gig = assigns(:gig)
    assert_not_nil gig
    assert_redirected_to gig_path(gig)
    gig = Gig.find('1')
    assert_equal 'some name', gig.name
    assert_equal 'some location', gig.location
    assert_equal Date.parse('2015-01-01'), gig.date
  end

  test "invalid update parameters works" do
    sign_in :user, User.find_by_email('test1@test.com')
    put :update, id:'1', gig:{date:'some date'}
    assert_not_nil assigns(:gig)
    assert_template :edit
    gig = Gig.find('1')
    assert_equal DateTime.parse('2015-05-18 18:10:39'), gig.date
  end

  test "destroy works" do
    sign_in :user, User.find_by_email('test1@test.com')
    assert_difference('Gig.count', -1) do
      delete :destroy, id:'1'
    end
    assert_redirected_to gigs_path
  end
end
