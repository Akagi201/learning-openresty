
-- lua_transform_underscores_in_response_headers

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
-- ngx.header.Foo = 'Bar'
-- ngx.header['Foo1'] = 'Bar1'
-- ngx.header['foo1'] = 'Bar1'
-- ngx.header['foo1_bar'] = 'Bar1'
--
-- ngx.header['foo_bar'] = {"a=32; path", "b=25"}
-- ngx.header['content_type'] = {"a=32; path", "text"}

-- test 2
-- ngx.say(type(ngx.header))

-- test 3
-- ngx.say(print_table(ngx.header))

-- test 4
ngx.header.Foo3 = 'Bar3'
local resp = ngx.resp.get_headers(0, true)
ngx.say(print_table(resp))
