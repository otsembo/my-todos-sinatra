class TodoController < AppController

    set :views, './app/views'

    # @method: Display a small welcome message
    get '/hello' do
        "Our very first controller"
    end

    # @method: Add a new TO-DO to the DB
    post '/todos/create' do
        begin
            todo = Todo.create( self.data(create: true) )
            json_response(code: 201, data: todo)
        rescue => e
            json_response(code: 422, data: { error: e.message })
        end
    end

    # @method: Display all todos
    get '/todos' do
        todos = Todo.all
        json_response(data: todos)
    end

    # @view: Renders an erb file which shows all TODOs
    # erb has content_type because we want to override the default set above
    get '/' do
        @todos = Todo.all.map { |todo|
          {
            todo: todo,
            badge: todo_status_badge(todo.status)
          }
        }
        @i = 1
        erb_response :todos
    end

    # @method: Update existing TO-DO according to :id
    put '/todos/update/:id' do
        begin
            todo = Todo.find(self.todo_id)
            todo.update(self.data)
            json_response(data: { message: "todo updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end

    # @method: Delete TO-DO based on :id
    delete '/todos/destroy/:id' do
        begin
            todo = Todo.find(self.todo_id)
            todo.destroy
            json_response(data: { message: "todo deleted successfully" })
        rescue => e
          json_response(code: 422, data: { error: e.message })
        end
    end


    private

    # @helper: format body data
    def data(create: false)
        payload = JSON.parse(request.body.read)
        if create
            payload["createdAt"] = Time.now
        end
        payload
    end

    # @helper: retrieve to-do :id
    def todo_id
        params['id'].to_i
    end

    # @helper: format status style
    def todo_status_badge(status)
        case status
            when 'CREATED'
                'bg-info'
            when 'ONGOING'
                'bg-success'
            when 'CANCELLED'
                'bg-primary'
            when 'COMPLETED'
                'bg-warning'
            else
                'bg-dark'
        end
    end


end