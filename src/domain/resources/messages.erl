-module(messages).

-export([dispatch/1, save/1]).

dispatch(Message) ->
  Node = nodes:lookup(message:id(Message)),
  nodes:notify(Node, Message).

save(Message) ->
  dispatch(Message),
  {ok, Message}.
