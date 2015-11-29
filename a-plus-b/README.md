## build
* `./configure --prefix=/opt/nginx --add-modle=/path/to/lua-nginx-module`

## lua in conf

```
server {
    #监听端口，若你的6699端口已经被占用，则需要修改
    listen 6699;
    location /add {
      set $res '';

      rewrite_by_lua '
        local a = tonumber(ngx.var.arg_a) or 0
        local b = tonumber(ngx.var.arg_b) or 0
        ngx.var.res = a + b
      ';
      
      content_by_lua '
        ngx.say(ngx.var.res)
      ';
    }
  }
```

## test
* `curl 'http://localhost:6699/add?a=6&b=7'`