-module(chat_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->

	Dispatch = cowboy_router:compile([
		{'_', [
			{"/messages", messages_handler, []},
			{'_'        , default_handler,  []}
		]}
	]),

	{ok, _} = cowboy:start_clear(my_http_listener, 100,
		[{port, 8080}],
		#{env => #{dispatch => Dispatch}}
	),
	chat_sup:start_link().

stop(_State) ->
	ok.
