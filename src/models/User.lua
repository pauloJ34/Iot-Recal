
local Model = require("lapis.db.model").Model

local User = Model:extend("users")


function User:insert(data)
	local user = self:create({
			name = data.username,
			apelido = data.nickname,
			matricula = data.registration
	})
	if user then
			return user
	end
	return false

end

return User
