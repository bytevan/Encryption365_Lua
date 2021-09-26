local _M = {
    _VERSION = '1.0.0'
}

local http = require("resty.http")
local cjson = require("cjson")

local function new_httpc()
    local httpc = ngx.ctx.acme_httpc
    if not httpc then
        httpc = http.new()
        ngx.ctx.acme_httpc = httpc
    end
    return httpc
end

local function post(uri, dt)
    local http=require("socket.http")
    local ltn12 = require("ltn12")
    local request_body = [[]]
    local response_body = {}
    local result, respcode, respheaders, respstatus= http.request{
        url='https://encryption365.trustocean.com/',
        method = "POST",
        source = ltn12.source.string(request_body),
        headers = {
        ["content-type"] = "text/plain",
        ["content-length"] = tostring(#request_body)
        },
        sink = ltn12.sink.table(response_body)
    }
    response_body = table.concat(response_body)
end

return _M