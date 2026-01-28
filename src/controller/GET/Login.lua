local verifier_login = require("src.controller.config.Session")

return function(self)
	-- if not self.session.user then
	--     self.session.user = {
	--         userName = "paulo",
	--     }

	local is_login = verifier_login.verifier(self)

	print("\n\n dabdjkas \n\n")
	if not is_login then
		return { render = "pages.Login" }
	end
	print("\n\n dabdjkas \n\n")
	-- return { redirect_to = "/" }
	return { redirect_to = "/" }
	-- return {redirect_to = self:url_for("home")}
end
