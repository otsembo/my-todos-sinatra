# My-Todos
My-Todos is a basic API built with ruby's Sinatra DSL. 

This project is a demo that shows the power of the DSL in building server-side applications quickly.

## Pre-Requisites
In order to use this repository you will need the following:

- Operating System **(Windows `10+`, Linux `3.8+`, or MacOS X `10.7+`)**
- RAM >= 4GB
- Free Space >= 2GB

## Built With
This application has been built with the following tools:

- **Ruby `v2.7.+`**
- **SQlite3 `v1.6`**
- **ActiveRecord `v7.0.4`**
- **Rake `v13.0.6`**
- **Puma `v6.1`**
- **rerun `v0.14`**
- **Sinatra `v3.0.5`**

## Setup
You can setup this repository by following this manual

1. Clone the repository
    ```{shell}
   git clone https://github.com/otsembo/my-todos-sinatra.git
   ```
2. Ensure the ruby gems are setup in your machine
    ```{shell}
   bundle install
   ```
3. Run the application
    ```{shell}
    rake start
    ```
4. Open the application from your browser
    ```
   https://localhost:9292
   ```
   
## Application
This application is a simple web API that allows users to:
- Create TODO items.
- Update individual TODO items.
- View all TODO items.
- Filter TODO items by date.
- Delete a TODO item.

### TODO PROPERTIES
- `id` => `Integer` - Unique identifier.
- `title` => `String` - The name of the task.
- `description` => `String` - A short description about the task.
- `due` => `Date` - The due date set.
- `createdAt` => `Date` - The date the task was created.
- `status` => `ENUM [CREATED, ONGOING, COMPLETED, CANCELLED]` - The status of the task.


The following routes are ready for use:
1. `/hello` - Presents a simple welcome message.

## LICENSE
This repository is distributed under the MIT License

```markdown
Copyright 2023 Ian Okumu

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), 
to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

## Author
This repository is maintained by:

- [Ian Okumu](https://github.com/otsembo) 