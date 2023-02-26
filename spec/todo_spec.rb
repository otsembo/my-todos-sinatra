APP = Rack::Builder.parse_file("config.ru").first

RSpec.describe 'TODO Controller' do
  include Rack::Test::Methods

  def app
    APP
  end

  it 'says hello' do
    get '/hello'
    expect(last_response).to be_ok
    expect(last_response.body.to_s).to eq("Our very first controller")
  end

end