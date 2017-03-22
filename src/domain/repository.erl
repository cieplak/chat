-module(repository).
-author("user").

-export([save/2]).

-spec save(message, message()) -> {ok, message()} | {error, list(<<>>)}.
save(message, Message) ->
  messages:save(Message).
