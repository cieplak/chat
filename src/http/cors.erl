-module(cors).

-export([set_header/1]).

set_header(Request) ->
  R0 = cowboy_req:set_resp_header(<<"access-control-allow-headers">>, <<"Content-Type, Authorization">>,   Request),
  R1 = cowboy_req:set_resp_header(<<"access-control-allow-methods">>, <<"GET, HEAD, OPTIONS, POST, PUT">>, R0),
  R2 = cowboy_req:set_resp_header(<<"access-control-allow-origin">>,  <<$*>>,                              R1),
  R3 = cowboy_req:set_resp_header(<<"access-control-max-age">>,       <<"1728000">>,                       R2),
  R3.
