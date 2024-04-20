

return function (self)
    -- if not self.session.user then
    --     self.session.user = {
    --         userName = "paulo",
    --     }
    -- end
    return {render = "pages.Login"}
    -- return {redirect_to = self:url_for("home")}
end