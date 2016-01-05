local json = require "cjson"

ngx.req.read_body()
local args = ngx.req.get_post_args()

if not args or not args.info then
  ngx.exit(ngx.HTTP_BAD_REQUEST)
end

local client_ip = ngx.var.remote_addr
local user_agent = ngx.req.get_headers()['user-agent'] or ''
local info = ngx.decode_base64(args.info)

local response = {}
response.info = info
response.ip = client_ip
response.user_agent = user_agent

ngx.say(json.encode(response))
