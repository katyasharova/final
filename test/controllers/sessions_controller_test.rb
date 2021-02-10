require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'cant go anywhere without login' do
    get logout_url
    get input_url
    assert_response :redirect
    assert_redirected_to login_url
  end

  test 'create fake user and make some stuff' do
    unless usr = User.find_by(login: 'Platypus').nil?
      User.find_by(login: 'Platypus').destroy 
    end
    User.create(login: 'Platypus', password:'1111', password_confirmation:'1111').save 
    get auth_url, params: { login: 'Platypus', password: '1111' }
    get output_url, params: { txt: '100' }
    assert_response :success
    User.find_by(login: 'Platypus').destroy if usr
  end

end
