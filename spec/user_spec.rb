# frozen_string_literal: true
APP = Rack::Builder.parse_file("config.ru").first

RSpec.describe 'USER Controller' do
  include Rack::Test::Methods

  before(:each) do
    User.destroy_all
    ActiveRecord::Base.connection.execute("UPDATE `sqlite_sequence` SET `seq` = 0 WHERE `name` = 'users';")
  end

  def app
    APP
  end

  it 'create an account successfully' do
    # TODO: pending implementation
  end

  it 'does not create an account with invalid data' do
    # TODO: pending implementation
  end

  it 'logs in a user with correct credentials' do
    # TODO: pending implementation
  end

  it 'does not log in a user with invalid credentials' do
    # TODO: pending implementation
  end

end
