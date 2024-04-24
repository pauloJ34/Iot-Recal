local lapis = require("lapis")
local json_params = require("lapis.application").json_params
local app = lapis.Application()
app:enable("etlua")
app.layout = require("views.components.layout.Layout")

-- Controle de rotas --
return function ()

    -- Controle da requisições --
    -- GET
    local home_page = require("src.controller.GET.Home")
    local login_page= require("src.controller.GET.Login")
    local logout_page = require("src.controller.GET.Logout")
    
    --POST
    local login_back= require("src.controller.POST.Logar")
    local data_field= require("src.controller.POST.DataField")
    
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
    app:get("logout", "/logout", logout_page)

    -- Metodo POST
    app:post("login-post", "/logar",json_params(login_back))
    app:get("fielddata", "/fielddata", data_field)

    -- teste de requisição de api externa
    app:get("teste", "/teste", function ()end)
    
    -- Metodo POST

    -- Metodo PUT

    -- Metodo DELETE
    
    return app
end



