# BearClone
> Bear is a Note Application. For learning purpose, I reproduce it to the closest of its behavior.
> This is only the Server part of the Application.
> It is supposed to handle: account creation, authentication, note saving.

> It will be separate in different branches:
> * master: the full application, with account, authentication and live saving
> * live: the application is not aware of users or authentication. It only knows about notes. It will save any update happening on the front end live, through channels.
> * simple: the application is only aware of notes, and work as a REST application with related CRUD actions.

> You can find the frontend application [here](https://github.com/arkanoryn/bear_clone-client).

## Installation
### Vagrant
Please, install Vagrant on your locale machine.
Once install, setup vagrant with `vagrant up` and log in: `vagrant ssh`.

### Application
To start the app:
  * Install dependencies with `mix deps.get`
  * Create, migrate and seed your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

You can start coding your frontend application and make your request on [`localhost:4000`](http://localhost:4000).

### Demo user
A user is already created in order for you to test your login front end.
The credentials are:
> * username: `demo`
> * password: `password`
