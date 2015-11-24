# learning-openresty

## PATH
* `lua_package_path "$prefix/lib/?.lua;";`

## run
* `openresty -p . -c conf/nginx.conf`

## reload
* `openresty -p . -c conf/nginx.conf -s reload`