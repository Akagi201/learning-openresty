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

local headers = ngx.req.get_headers(0, true)

ngx.log(ngx.ERR, "print_table(headers) ", print_table(headers))

ngx.log(ngx.ERR, "ngx.var.http_host ", ngx.var.http_host)
ngx.log(ngx.ERR, "ngx.var.uri ", ngx.var.uri)
ngx.log(ngx.ERR, "ngx.var.remote_addr ", ngx.var.remote_addr)
ngx.log(ngx.ERR, "ngx.var.args ", ngx.var.args)

ngx.say("Test Server get u")
