local lapis = require("lapis")
local respond_to = require("lapis.application").respond_to
local json_params = require("lapis.application").json_params
local validate = require("lapis.validate")
local app = lapis.Application()
local dev = require("env").dev
local not_key = require("src.infra.Erros_code").not_key


app:enable("etlua")
app.layout = require("views.components.layout.Layout")

-- Controle de rotas --
return function()
	-- Controle da requisições --
	-- GET
	local home_page = require("src.controller.GET.Home")
	local login_page = require("src.controller.GET.Login")
	local logout_page = require("src.controller.GET.Logout")
	local iot_send_data = require("src.infra.Iot_send")
	--POST
	local login_back = require("src.controller.POST.Logar")
	local data_field = require("src.controller.POST.DataField")
	-- Rotas de requisições --
	--[[
					Observações:
					- a função da requição fica em src/controller

					Observações da requição do Lapis
					- app."tipo da requisição GET,POST..."("nome da Rota", "rota da requisição", função da requisição)
			]]
	--

	-- Metodo GET
	app:get("home", "/", home_page)
	app:get("login", "/login", login_page)
	app:get("logout", "/logout", logout_page)

	-- Metodo POST
	app:post("login-post", "/logar", json_params(
		function(self)
			return login_back(self, dev)
		end
	))

	app:get("fielddata", "/:matricula/fielddata", data_field)

	-- teste de requisição de api externa
	app:get("teste", "/teste", function() end)

	-- Metodo GET/POST

	-- Metodo de recebimento de dados
	app:match("iot", "/iot", respond_to({
		GET = function(self)
			return { iot_send_data(self, "get", dev) }
		end,
		POST = function(self)
			return { iot_send_data(self, "post", dev) }
		end
	}))

	app:match("iot", "/iot-json", json_params(function(self)

	end))


	-- Metodo PUT

	-- Metodo DELETE




	return app
end