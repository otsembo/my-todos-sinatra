# frozen_string_literal: true

class UserController < AppController

  # @helper: read JSON body
  before do
    begin
      @user = user_data
    rescue
      @user = nil
    end
  end

  #@method: create a new user
  post '/auth/register' do
    begin
      x = User.create(@user)
      json_response(code: 201, data: x)
    rescue => e
      error_response(422, e)
    end
  end

  #@method: log in user using email and password
  post '/auth/login' do
    begin
      user_data = User.find_by(email: @user['email'])
      if user_data.password == @user['password']
        json_response(code: 200, data: {
          id: user_data.id,
          email: user_data.email
        })
      else
        json_response(code: 422, data: { message: "Your email/password combination is not correct" })
      end
    rescue => e
      error_response(422, e)
    end
  end

  private

  # @helper: parse user JSON data
  def user_data
    JSON.parse(request.body.read)
  end

end
