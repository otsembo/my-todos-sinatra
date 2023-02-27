[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://gitHub.com/otsembo/my-todos-sinatra/graphs/commit-activity)
[![GitHub forks](https://img.shields.io/github/forks/otsembo/my-todos-sinatra.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/otsembo/my-todos-sinatra/network/)
[![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](https://github.com/otsembo/my-todos-sinatra/blob/master/LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Linux](https://svgshare.com/i/Zhy.svg)](https://svgshare.com/i/Zhy.svg)
[![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

# My-Todos
My-Todos is a basic API built with ruby's Sinatra DSL. 

This project is a demo that shows the power of the DSL in building server-side applications quickly.

The application has been built with the MVC design pattern.

## Pre-Requisites
In order to use this repository you will need the following:



- Operating System **(Windows `10+`, Linux `3.8+`, or MacOS X `10.7+`)**
- RAM >= 4GB
- Free Space >= 2GB

## Built With
This application has been built with the following tools:

![ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![sqlite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)
![bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)


- **Ruby `v2.7.+`**
- **SQlite3 `v1.6`**
- **ActiveRecord `v7.0.4`**
- **Rake `v13.0.6`**
- **Puma `v6.1`**
- **rerun `v0.14`**
- **Sinatra `v3.0.5`**
- **Bootstrap `v5.3.0`**
- **ERB `v4.0`**

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
3. Perform any pending database migrations
   ```{shell}
   rake db:migrate
   ```
4. Run the application
    ```{shell}
    rake start
    ```
5. Open the application from your browser
    ```
   http://localhost:9292
   ```
   
## Application
This application is a simple web API that allows users to:

- Register a new account.
- Log in to existing account.
- Create TODO items.
- Update individual TODO items.
- View all TODO items.
- Filter TODO items by date.
- Delete a TODO item.

### MODELS
Database schema definitions.

#### TODO

| COLUMN      | DATA TYPE                                       | DESCRIPTION                         | 
|-------------|-------------------------------------------------|-------------------------------------|
| id          | Integer                                         | Unique identifier.                  |
| title       | String                                          | The name of the task.               |
| description | String                                          | A short description about the task. |
| due         | Date                                            | The set due date for the task.      |
| createdAt   | Date                                            | The date the task was created.      |
| status      | ENUM `[CREATED, ONGOING, COMPLETED, CANCELLED]` | TThe status of the task.            |


#### USER
| COLUMN        | DATA TYPE | DESCRIPTION                           | 
|---------------|-----------|---------------------------------------|
| id            | Integer   | Unique identifier.                    |
| full_name     | String    | User's full name.                     |
| password_hash | String    | User's password hashed with `BCrypt`. |
| updated_at    | Date      | The date the user was updated.        |
| createdAt     | Date      | The date the user was created.        |


### ROUTES

1. `/hello` - Presents a simple welcome message.
2. `/auth/register` - Create a new user account.
   
   ```{json}
   ## REQUEST BODY
   {
    "full_name": "John Doe",
    "email": "mail@mail.com",
    "password": "12345678"
   }
   ```
3. `/auth/login` - Log in a user using email and password.

   ```{json}
   ## REQUEST BODY
   {
    "email": "mail@mail.com",
    "password": "12345678"
   }
   ```
4. `/todos/create` - Add a new TODO item.

   ```{json}
   ## REQUEST BODY
   {
    "title": "Make Breakfast",
    "description": "Prepare milk and cereal",
    "due": "2023-09-09"
   }
   ```
5. `/todos` - List all TODO items.

   ```{json}
   ## RESPONSE SAMPLE
   {
    "data": [
        {
            "id": 2,
            "title": "Running another DSA practice 2",
            "description": "A wild desc",
            "due": "2023-02-24T00:00:00.000Z",
            "createdAt": "2023-02-24T09:34:41.856Z",
            "status": "CREATED"
        }],
    "message": "SUCCESS"
   }
   ```
6. `/todos/update/:id` - Update an existing TODO.
7. `/todos/delete/:id` - Delete a TODO item.
8. `/` - Render a table of all todos using Bootstrap and ERB

![Todo Table](screens/todo_table.png)

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