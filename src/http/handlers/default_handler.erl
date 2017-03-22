-module(default_handler).
-export([init/2]).

init(Request, State) ->
  Method   = cowboy_req:method(Request),
  Path     = cowboy_req:path(Request),
  Body     = error_views:render(json, not_found, {Method, Path}),
  Headers  = #{<<"content-type">> => <<"application/json">>},
  Req      = cors:set_header(Request),
  Response = cowboy_req:reply(404, Headers, Body, Req),
  {ok, Response, State}.
