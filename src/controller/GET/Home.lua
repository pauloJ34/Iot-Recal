local verifier_login = require("src.controller.config.Session")

return function(self)

    local is_login = verifier_login.verifier(self)
    -- print("\n\n\n\n"..is_login.."\n\n\n\n")
    if is_login then
        return { render = "pages.Home" }
    end
    return { redirect_to = "login" }
end
