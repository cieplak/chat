-module(rest).

-export([init/1,
  get_index/3,
  post/3,
  options/3,
  not_found/3]).

init(MethodDispatcher) ->
  fun(Request, State) ->
    Method   = cowboy_req:method(Request),
    Headers  = #{<<"content-type">> => <<"application/json">>},
    Response = MethodDispatcher(Method, Request, Headers),
    {ok, Response, State}
  end.

get_index(Resource, Request, Headers) ->
  Body = index_views:render(json, Resource),
  Req  = cors:set_header(Request),
  cowboy_req:reply(200, Headers, Body, Req).

post(Type, Request, Headers) ->
  {ok, RequestBody, _} = cowboy_req:read_body(Request),
  case forms:parse(Type, RequestBody) of

    {ok, Form} ->
      Object  = repository:save(Type, Form),
      Body    = domain_views:render(json, Type, Object),
      Req     = cors:set_header(Request),
      cowboy_req:reply(201, Headers, Body, Req);

    {error, Errors} ->
      Body = error_views:render(json, bad_request, Errors),
      Req  = cors:set_header(Request),
      cowboy_req:reply(400, Headers, Body, Req)

  end.

options(Methods, Request, Headers) ->
  Req0 = cowboy_req:set_resp_header(<<"Allow">>, Methods, Request),
  Req1 = cors:set_header(Req0),
  cowboy_req:reply(200, Headers, Req1).

not_found(Method, Req0, Headers) ->
  Path = cowboy_req:path(Req0),
  Body = error_views:render(json, not_found, {Method, Path}),
  Req  = cors:set_header(Req0),
  cowboy_req:reply(404, Headers, Body, Req).
