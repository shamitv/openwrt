#!/bin/sh
uci batch << EOF
set nlbwmon.@nlbwmon[0].netlink_buffer_size='5242880'
set nlbwmon.@nlbwmon[0].database_generations='100000'
set nlbwmon.@nlbwmon[0].refresh_interval='30s'
set nlbwmon.@nlbwmon[0].database_interval='1'
set nlbwmon.@nlbwmon[0].commit_interval='10m'
set nlbwmon.@nlbwmon[0].database_limit='1000000'
set nlbwmon.@nlbwmon[0].database_directory='/data/nlbwmon'
commit
EOF
exit 0
