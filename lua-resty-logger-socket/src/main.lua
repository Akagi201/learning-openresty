
local logger = require "resty.logger.socket"

if not logger.initted() then
    local ok, err = logger.init {
        host = 'xxx',
        port = 1234,
        flush_limit = 1234,
        drop_limit = 5678,
    }
    if not ok then
        ngx.log(ngx.ERR, "failed to initialize the logger: ",
            err)
        return
    end
end

-- construct the custom access log message in
-- the Lua variable "msg"

local bytes, err = logger.log(msg)
if err then
    ngx.log(ngx.ERR, "failed to log message: ", err)
    return
end
