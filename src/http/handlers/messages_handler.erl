-module(messages_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Request, State) ->
  Method  = cowboy_req:method(Request),
  Headers = #{<<"content-type">> => <<"application/json">>},
  Resp    = case Method of
              <<"GET">>     -> get(Request, Headers);
              <<"POST">>    -> post(Request, Headers);
              <<"OPTIONS">> -> options(Request, Headers);
              Method        -> rest:not_found(Method, Request, Headers)
            end,
  Response = cors:set_header(Resp),
  {ok, Response, State}.

get(Request, Headers) ->
  rest:get_index(message, Request, Headers).

post(Request, Headers) ->
  rest:post(message, Request, Headers).

options(Request, Headers) ->
  rest:options([<<"GET">>, <<"POST">>, <<"OPTIONS">>], Request, Headers).
