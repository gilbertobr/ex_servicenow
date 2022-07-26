FROM elixir:1.13-alpine

ENV FUNCTION ExServicenow.get_query_change_request([])
ENV URL_SERVICENOW https://myorganization.service-now.com
ENV USERNAME_SERVICENOW username
ENV PASSWORD_SERVICENOW password

WORKDIR /app
COPY ./ /app
RUN cd /app && \
mix local.hex --force && \
mix local.rebar --force && \
mix deps.get && \
mix compile
CMD mix run -e "IO.inspect($FUNCTION, limit: :infinity)"

