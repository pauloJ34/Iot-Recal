local field_data     = require("src.models.Field")
local verifier_login = require("src.controller.config.Session")
local err_mess       = require("src.infra.Erros_code")
local config_default = require("env")
math.randomseed(os.time())

return function(self, method, dev)
	-- verificar se está logado para acessar essa função
	if verifier_login.verifier(self) then
		local parameter = {}
		local it_success = false
		local data_parameter = {}

		if method == "get" then
			parameter = self.GET
		elseif method == "post" then
			parameter = self.POST
		end

		-- caso não possua o campo "key" do iot
		if not parameter.key then
			return { err_mess.not_key }
		end

		for title, value in pairs(parameter) do
			print("\n\n\n" .. title .. "")
			-- estrutura de recebimento do parameter:
			-- json{
			--		key: "", -- chave mac do iot ou chave que o sistema cria
			--		field1: "", ... -- campo de adesão dos dados
			-- }

			if title ~= "key" then -- pegar somente o campo de fields
				-- pcall serve como try catch
				--
				local data = {
					title             = title,
					data              = value,
					token_iot         = parameter.key,
					date_time         = os.date("%Y/%m/%d %H:%M:%S") .. " -03:00",
					registration_user = self.session.user.registration
				}

				local success, message = pcall(field_data.criar, data)
				if success then -- o acesso
					table.insert(data_parameter, data)
					it_success = true
				else
					return { err_mess.user_err }
					--[[
					return {
						status = 401,
						json = {
							status = 401,
							message = message
						}
					}
					]] --
				end
			end
		end
		if it_success and dev then
			return {
				status = 200,
				json = {
					status = 200,
					data = { data_parameter }
				}
			}
		else
			return {
				status = 200,
				json = { status = 200 }
			}
		end
	end
end