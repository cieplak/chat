-module(error_views).

-export([render/3]).

render(json, bad_request, Errors) ->
  ErrorsJson = jsx:encode(Errors),
  [
    <<"{\n">>,
    <<"  \"name\":        \"Bad Request\",\n">>,
    <<"  \"status_code\": 400,\n">>,
    <<"  \"errors\": ">>,
    ErrorsJson,
    <<"\n}\n">>
  ];

render(json, not_found, {Method, Path}) ->
  [
    <<"{\n">>,
    <<"  \"name\":        \"Not Found\",\n">>,
    <<"  \"status_code\": 404,\n">>,
    <<"  \"path\": ">>, <<$">>,Method, <<" ">>, Path, <<$">>,
    <<"\n}\n">>
  ].
