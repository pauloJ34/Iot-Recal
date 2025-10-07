local Model = require("lapis.db.model").Model

local User = Model:extend("users")

local user = {
	-- criar usuária/ slavar um novo usuário
	criar = function(data)
		
		local u = User:create({
			name 				= data.username,
			nickname 		= data.nickname,
			registration 	= data.registration
		})

		if u then 
			return true
		end
		return false
	end,

	visualizar_dados = function(id)
		local u = User:find({
			registration = id
		})
		if u then
			return u
		end
		return false
	end
} 

return user
