return function(self)
    
    if self.session.user then
        print("\n\n" .. self.session.user.userName .. "\n\n")
        return { render = "pages.Home" }
    else
        return { redirect_to = "login" }

    end
end
