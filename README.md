# Simple Todo List Application #
## https://todo-list-web-front.herokuapp.com/
#### ( Vue 3 | Vuex 4 | Axios | Ruby on Rails 7 | PostgreSQL | Docker | Github Actions )

### Getting started

To get started with the app, first clone the repository and cd into the directory:
```
$ git clone https://github.com/alikrugl/TodoList
$ cd TodoList
```
Then install needed gems
```
$ bundle install --without production
```
Next, create and migrate the database:
```
$ rails db:create db:migrate
```
Install dependencies for your application:
```
$ yarn install
```
Finally, start api and frontend part on local machine: 
```
$ yarn serve
$ rails server -p 3000
```
Move to http://localhost:8080/

### Docker

Also this project includes docker setup ( .env file is required )

```
$ docker-compose build
$ docker-compose up
```
