FROM elixir:1.13-alpine

RUN mix local.hex --force

WORKDIR /app

CMD mix phx.server
