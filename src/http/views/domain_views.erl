-module(domain_views).

-export([render/3]).

render(json, message, Message) ->
  Id          = message:id(Message),
  Source      = message:source(Message),
  Destination = message:destination(Message),
  Metadata    = jsx:encode(message:metadata(Message)),
  Content     = message:content(Message),
  [
    <<"{\n">>,
    <<"  \"id\":           \"">>,            Id,          <<"\", \n">>,
    <<"  \"path\":         \"/messages/">>,  Id,          <<"\", \n">>,
    <<"  \"source\":       ">>,              Source,      <<", \n">>,
    <<"  \"destination\":  ">>,              Destination, <<", \n">>,
    <<"  \"metadata\":     ">>,              Metadata,    <<", \n">>,
    <<"  \"content\":      ">>,              Content,     <<", \n">>,
    <<"} \n">>].
