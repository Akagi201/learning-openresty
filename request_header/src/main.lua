local function print_table(t)
  local function parse_array(key, tab)
    local str = ''
    for _, v in pairs(tab) do
      str = str .. key .. ' ' .. v .. '\r\n'
    end

    return str
  end

  local str = ''
  for k, v in pairs(t) do
    if type(v) == "table" then
      str = str .. parse_array(k, v)
    else
      str = str .. k .. ' ' .. (v) .. '\r\n'
    end
  end
  return str
end

-- test 1
-- local headers = ngx.req.get_headers(0, true)
-- ngx.say(print_table(headers))

-- test 2
-- ngx.req.set_header('Foo1', {'Bar1', 'Bar2'})
-- ngx.req.set_header('Foo2', 'Bar3')
-- ngx.req.set_header('user-agent', nil)
-- ngx.req.set_header('user-agent', {})

-- local res = ngx.location.capture('/sub_request_header')

-- if res.status == ngx.HTTP_OK then
  -- ngx.say(res.body)
-- else
  -- ngx.exit(res.status)
-- end

-- test 3

local res = ''
local host = ngx.var.http_host
res = res .. host
local m, err = ngx.re.match(host, '^([^:]+)')
res = res .. ' ' .. m['Host']
ngx.say(res)
