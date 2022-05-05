# Elixir Phoenix Quickstart

This is a Elixir Phoenix Quickstart for [Nullstone](https://nullstone.io).
This is based off the official Phoenix [Up and Running](https://hexdocs.pm/phoenix/up_and_running.html) guide.


## Running locally

You can run this project locally inside Docker or using elixir alone.
To use docker, this project contains `docker-compose.yml` that runs with `MIX_ENV=dev`.
This setup ensures that using Docker doesn't inhibit typical development workflows:
- Hot reload is configured so that changes to the app doesn't require a reboot
- Dependencies are installed on boot of docker container

## How to launch via Nullstone

1. Create postgresql datastore.
2. Create a public web app. (Remember `app-name` for later)
3. Add the postgresql datastore (from step 1) to the app.
4. Add the `SECRET_KEY_BASE for Rails Cookies` capability to the app. (this capability works for Rails and Phoenix)
5. Provision
  ```shell
  nullstone up --wait --block=<app-name> --env=<env-name>
  ```
6Build, push, and deploy
  ```shell
  docker build -t phoenix-quickstart .
  nullstone launch --source=phoenix-quickstart --app=<app-name> --env=<env-name>
  ```

### Hot reload

The `app` in `docker-compose.yml` is configured to automatically reload changes to files.
You do not need to rebuild/restart the app when making changes to your app.

### Update dependencies

However, when updating dependencies, you will need to restart your docker container.
The dependencies will be installed on boot of the docker container.

```shell
docker compose restart app
```

## Details about quickstart

This app was generated following these steps.
1. `mix phx.new --app=elixir_phoenix_quickstart .`
2. `mix phx.gen.release --docker`
3. Change `config/dev.exs` to ensure local docker works:
  ```elixir
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {0, 0, 0, 0}, port: 4000],
  ```
4. Change `config/dev.exs` to use env var for database url:
  ```elixir
  # Configure your database
  config :elixir_phoenix_quickstart, ElixirPhoenixQuickstart.Repo, 
    url: System.get_env("DATABASE_URL"), 
  #  username: "postgres",
  #  password: "postgres",
  #  hostname: "localhost",
  #  database: "elixir_phoenix_quickstart_dev",
    ...
  ```
