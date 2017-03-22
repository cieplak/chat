-module(message).

-export_type([message/0]).

-export([
  new/0, new/1,
  id/1, id/2,
  source/1, source/2,
  destination/1, destination/2,
  metadata/1, metadata/2,
  content/1, content/2
]).

-type id() :: binary().

-record(message, {
  id           :: id(),
  source       :: id(),
  destination  :: id(),
  metadata     :: map(),
  content      :: binary()
}).

-opaque message() :: #message{}.

%% Constructors

-spec new() -> message().
new() -> #message{}.

-spec new(map()) -> message().
new(Map) ->
  #{
    id          := Id,
    source      := Source,
    destination := Destination,
    metadata    := Metadata,
    content     := Content
  } = Map,
  #message{
    id          = Id,
    source      = Source,
    destination = Destination,
    metadata    = Metadata,
    content     = Content
  }.

%% Getters

-spec id(message()) -> id().
id(#message{} = Message) ->
  Message#message.id.

-spec source(message()) -> id().
source(#message{} = Message) ->
  Message#message.source.

-spec destination(message()) -> id().
destination(#message{} = Message) ->
  Message#message.destination.

-spec metadata(message()) -> map().
metadata(#message{} = Message) ->
  Message#message.metadata.

-spec content(message()) -> binary().
content(#message{} = Message) ->
  Message#message.content.

%% Setters

-spec id(message(), id()) -> message().
id(#message{} = Message, Id) ->
  Message#message{id = Id}.

-spec source(message(), id()) -> message().
source(#message{} = Message, Source) ->
  Message#message{source = Source}.

-spec destination(message(), id()) -> message().
destination(#message{} = Message, Destination) ->
  Message#message{destination = Destination}.


-spec metadata(message(), map()) -> message().
metadata(#message{} = Message, Metadata) ->
  Message#message{metadata = Metadata}.

-spec content(message(), binary()) -> message().
content(#message{} = Message, Content) ->
  Message#message{content = Content}.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-ifdef(EUNIT).

constructor_test() ->
  ?assertMatch(
    #message{},
    message:new()
  ).

setters_test() ->
  Funs = [
    fun(X) -> message:id          (X, <<"MSGtX27ySjp9RWheaau1p6qb2">>)           end,
    fun(X) -> message:source      (X, <<"USR72YNtjETLKd781ps1ZC1vb">>)           end,
    fun(X) -> message:destination (X, <<"GRP3V42gBMHYoUVvQ99QgQq2b">>)           end,
    fun(X) -> message:metadata    (X, #{<<"content-type">> => <<"text/plain">>}) end,
    fun(X) -> message:content     (X, <<"Do you like kittens?">>)                end
  ],
  Message = lists:foldl(fun(F, X) -> F(X) end, message:new(), Funs),
  io:format("MyValue: ~p~n", [Message]),
  ?assertEqual(
    Message,
    #message{
      id          = <<"MSGtX27ySjp9RWheaau1p6qb2">>,
      source      = <<"USR72YNtjETLKd781ps1ZC1vb">>,
      destination = <<"GRP3V42gBMHYoUVvQ99QgQq2b">>,
      metadata    = #{<<"content-type">> => <<"text/plain">>},
      content     = <<"Do you like kittens?">>
    }
  ).

-endif.