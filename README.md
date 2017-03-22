# Chat

Simple chat web service (`/src`) and web app (`/www`).

## Deploying the Chat Service

On FreeBSD (depends on GNU Make):

```
git clone git@github.com:cieplak/chat.git
cd chat
fetch https://erlang.mk/erlang.mk
gmake -f erlang.mk bootstrap bootstrap-rel
gmake run
```

On Linux:

```
git clone git@github.com:cieplak/chat.git
cd chat
wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap bootstrap-rel
make run
```

Once the chat service is running, reverse proxy to it and register your CNAME :) .

## Packaging the Client HTML/JS

```
cd chat/www
npm install
make
cd /tmp/build
python -m SimpleHTTPServer
```

When ready, serve via CDN.

## Enjoying

Navigate your browser to `http://localhost:8000` and invite other folks to do the same.
