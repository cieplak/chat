#!/bin/csh

fetch https://erlang.mk/erlang.mk
gmake -f erlang.mk bootstrap bootstrap-rel
