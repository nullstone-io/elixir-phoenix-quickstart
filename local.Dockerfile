FROM bitwalker/alpine-elixir-phoenix

ENV MIX_ENV dev

WORKDIR /
COPY local.entrypoint.sh .
RUN chmod +x /local.entrypoint.sh
ENTRYPOINT ["/local.entrypoint.sh"]

WORKDIR /app

CMD mix phx.server
