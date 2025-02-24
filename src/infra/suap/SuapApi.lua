local json = require('cjson')
local http = require("lapis.nginx.http")

local api = {
    tokens = function(username, password)
        -- metodo POST
        local body, status_code, headers = http.simple({
            url = "https://suap.ifrn.edu.br/api/v2/autenticacao/token/",
            method = "POST",
            headers = {
                ["accept"] = "application/json",
                ["Content-Type"] = "application/json"
            },
            body = "{\"username\": \"" .. username .. "\", \"password\":\"" .. password .. "\"}"
        })
        local table_json = json.decode(body)

        return table_json
    end,
    dataUser = function(token)
        -- metodo GET, com parametros no headers, tendo o principal o Authorization
        local body, status_code, headers = http.simple({
            url = "https://suap.ifrn.edu.br/api/v2/minhas-informacoes/meus-dados/",
            method = "GET",
            headers = {
                ["accept"] = "application/json",
                ["Authorization"] = "Bearer " .. token
            }
        })

        local table_json = json.decode(body)

        -- if table_json.vinculo then
        --     return table_json.vinculo
        -- end

        return table_json
    end
}
return api

-- function tokens(username, password)
--
-- end

-- function dataUser(token)
--     local body, status_code, headers = http.simple({
--         url = "https://suap.ifrn.edu.br/api/v2/minhas-informacoes/meus-dados/",
--         method = "GET",
--         headers = {
--             ["accept"] = "application/json",
--             ["Authorization"] = "Bearer "..token,
--             ["content-type"] = "application/json"
--         },
--         body = {
--             name = "leafo"
--         }
--     })
-- end
