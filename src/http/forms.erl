-module(forms).

-export([parse/2]).

-spec parse(message, <<>>) -> {ok, message()} | {error, list(<<>>)}.
parse(message, Body) ->

  Payload = jsx:decode(Body, [return_maps]),

  #{
    <<"id">>          := Id,
    <<"source">>      := Source,
    <<"destination">> := Destination,
    <<"metadata">>    := Metadata,
    <<"content">>     := Content
  } = Payload,

  Form = message:new(#{
    id          => Id,
    source      => Source,
    destination => Destination,
    metadata    => Metadata,
    content     => Content
  }),

  {ok, Form}.
