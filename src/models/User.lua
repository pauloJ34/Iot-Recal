local Model = require("lapis.db.model").Model

local User = Model:extend("users", {
	primary_key = "registration"
})

local user = {
	-- criar usuária/ slavar um novo usuário
	criar = function(data)
		local u = User:create(
			{
				name         = data.username,
				nickname     = data.nickname,
				registration = data.registration,
				token        = data.token
			}
		)

		if u then
			return true
		end
		return false
	end,

	visualizar_dados = function(userID)
		local u = User:find(
			{
				registration = userID
			}
		)
		if u then
			return u
		end
		return false
	end,
	pesquisar_token = function(token)
		local u = User:find(
			{
				token = token
			}
		)
		if u and u.registration then
			return u.registration
		end
		return false
	end
}

return user