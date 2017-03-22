PROJECT = chat
PROJECT_DESCRIPTION = electronic communication system
PROJECT_VERSION = 0.1.0

DEPS = cowboy jsx lager

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

TEST_ERLC_OPTS += +'{parse_transform, eunit_autoexport}'
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}' +debug_info

DEP_PLUGINS = cowboy

dep_cowboy_commit = master

include erlang.mk
