APP = Rack::Builder.parse_file("config.ru").first

RSpec.describe 'TODO Controller' do
  include Rack::Test::Methods

  before(:each) do
    Todo.destroy_all
    ActiveRecord::Base.connection.execute("UPDATE `sqlite_sequence` SET `seq` = 0 WHERE `name` = 'todos';")
  end

  def app
    APP
  end

  it 'says hello' do
    get '/hello'
    expect(last_response).to be_ok
    expect(last_response.body.to_s).to eq("Our very first controller")
  end

  # create task
  it 'creates a new task' do
    post '/todos/create', body = '{ "due": "2023-04-04", "title": "Check", "description": "One two" }'
    expect(last_response).to be_created
  end

  it 'does not create a task with invalid data' do
    post '/todos/create', body = '{ "due": "2023-04-04" }'
    expect(last_response.status).to equal(422)
  end

  # display tasks
  it 'shows all created tasks' do
    create_task(number = 10)
    get '/todos'
    data = JSON.parse(last_response.body)
    expect(data["data"].length).to equal(10)
  end

  # update task based on id
  it 'updates an existing record' do
    todo = JSON.parse(create_task)["data"]
    id = todo["id"]
    put "/todos/update/#{id}", body = "{ \"title\":\"Updated\" }"
    expect(last_response).to be_ok
  end

  # delete task based on id
  it 'deletes an existing record' do
    todo = JSON.parse(create_task)["data"]
    id = todo["id"]
    delete "/todos/destroy/#{id}"
    expect(last_response).to be_ok
    expect(Todo.all.length).to eq(0)
  end

  ## Helpers
  # create a new task
  def create_task(number = 1)
    if number < 2
      post '/todos/create', body = dummy_task
      last_response.body
    else
      number.times do
        post '/todos/create', body = dummy_task
      end
    end

  end

  private

  def dummy_task
    "{\"title\": \"#{Faker::Name.unique.name}\", \"description\": \"#{Faker::Address.name.to_s}\",\"due\": \"#{Faker::Date.unique.to_s}\"}"
  end

end