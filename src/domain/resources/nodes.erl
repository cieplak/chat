-module(nodes).

-export([lookup/1, notify/2, register/1]).

-spec notify(node(), message()) -> {ok, node()} | {error}.
notify(Node, Message) ->
  {ok, Node, Message}.

-spec register(node()) -> {ok, node()}.
register(Node) ->
  {ok, Node}.

-spec lookup(id()) -> node().
lookup(Id) ->
  {ok, Id}.
