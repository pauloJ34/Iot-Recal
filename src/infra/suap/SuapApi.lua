local json = require('cjson')
local http = require("lapis.nginx.http")

local api = {
    tokens = function(username, password)
        -- metodo POST
        local body, status_code, headers = http.simple({
            url = "https://suap.ifrn.edu.br/api/token/pair",
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
    tokens_refrash = function(token)
        local body, status_code, headers = http.simple({
            url = "https://suap.ifrn.edu.br/api/token/refresh ",
            method = "POST",
            headers = {
                ["accept"] = "application/json",
                ["Content-Type"] = "application/json"
            },
            body = "{\"refresh\": \"" ..token.. "\"}"
        })
        local table_json = json.decode(body)

        return table_json

    end,
    dataUser = function(token1, token2)
        -- metodo GET, com parametros no headers, tendo o principal o Authorization
        local body, status_code, headers = http.simple({
            url = "https://suap.ifrn.edu.br/api/ensino/meus-dados-aluno/",
            method = "GET",
            headers = {
                ["accept"] = "application/json",
                ["Authorization"] = "Bearer " .. token1
            }
        })
        local body1, status_code1, headers1 = http.simple({
            url = "https://suap.ifrn.edu.br/api/rh/eu/",
            method = "GET",
            headers = {
                ["accept"] = "application/json",
                ["Authorization"] = "Bearer " .. token2
            }
        })

        local table_json    = json.decode(body)
        local table_json1   = json.decode(body1)


        local data_user = {
            apelido     = table_json1.nome_usual,
            matricula   = table_json1.identificacao,
            situacao    = table_json.situacao,
            nome        = table_json1.nome

        }

        -- if table_json.vinculo then
        --     return table_json.vinculo
        -- end

        return data_user
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
