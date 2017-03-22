-module(index_views).
-export([render/2]).

render(json, root) ->
  [
    <<"{\n">>,
    <<"  \"name\": \"Chat API Index\",\n">>,
    <<"  \"path\": \"/\",\n">>,
    <<"  \"links\": {\n">>,
    <<"    \"messages\": {\n">>,
    <<"      \"methods\": [\"GET\", \"POST\"],\n">>,
    <<"      \"path\":    \"/messages\"\n">>,
    <<"    }\n">>,
    <<"  }\n">>,
    <<"}\n">>
  ].
