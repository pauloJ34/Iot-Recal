local logarSession = require("src.controller.config.Session")

return function(self)

    local data = {
        username = self.params.username,
        password = self.params.password
    }


    return logarSession.login(self, data)

    -- return { json = { userData } }

    -- return { json = { tokens } }
end
