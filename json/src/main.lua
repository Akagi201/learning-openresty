local json = require "cjson"

local function format_table(t)
  local str = ''
  for k, v in pairs(t) do
    str = str .. k .. '==' .. v .. '\r\n'
  end
  return str
end
