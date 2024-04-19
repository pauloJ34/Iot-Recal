local lapis = require("lapis")
local http = require("lapis.nginx.http")
local json = require('cjson')
local app = lapis.Application()
app:enable("etlua")
app.layout = require("views.components.layout.Layout")

-- Controle de rotas --
return function ()

    -- Controle da requisições --
    local home_page = require("src.controller.Home")
    local login_page = require("src.controller.Login")
    
    
    -- Rotas de requisições --
    
    --[[
        Observações:
        - a função da requição fica em src/controller

        Observações da requição do Lapis
        - app."tipo da requisição GET,POST..."("nome da Rota", "rota da requisição", função da requisição)
    ]]--
    
    -- Metodo GET
    app:get("home", "/", home_page)
    app:get("login", "/login", login_page)
    -- teste de requisição de api externa
    app:get("teste", "/teste", function ()
        local body, status_code, headers = http.simple("https://suap.ifrn.edu.br/api/v2/autenticacao/token/", {
            username = "20211134040011",
            password = "Pipoca"
        })
        local table_json = json.decode(body)
        
        print("\n\n".. status_code.."\n\n")
        print("\n\n>>>>>>"..body.."<<<<<<<<<<<<\n\n")
        
        if(status_code == 200)
        then
            --[[
                Json formato
                status code = 200
                
                table_json{
                    refresh,
                    accesse
                }

                status code = 401

                table_json{
                    detail
                }

            ]]--
            print("\n\n>>>>>>"..table_json.refresh.."<<<<<<<<<<<<\n\n")
        else
            print("\n\n>>>>>>"..table_json.detail.."<<<<<<<<<<<<\n\n")
        end
        return "teste"

    end)
    
    -- Metodo POST

    -- Metodo PUT

    -- Metodo DELETE
    
    return app
end



