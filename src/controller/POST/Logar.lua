local sessionLogin = require("src.controller.config.Session")



return function(self, dev)
	local data = {
		username = self.params.username,
		password = self.params.password
	}

	return sessionLogin.login(self, data, dev)

	-- return { json = { userData } }

	-- return { json = { tokens } }
end
