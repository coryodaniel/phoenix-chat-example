FROM elixir:1.12-alpine
ENV MIX_ENV=prod
WORKDIR /app

RUN apk add --update openssl ncurses openssh nodejs postgresql-client build-base

COPY mix.exs mix.lock ./

RUN mix local.hex --force && \
  mix local.rebar --force && \
  mix deps.get --only-prod && \
  mix compile

COPY . .
ENV SECRET_KEY_BASE=stub
RUN mix phx.digest

CMD ["/app/entrypoint.sh"]
