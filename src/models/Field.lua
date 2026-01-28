local Model = require("lapis.db.model").Model
local Field = Model:extend("data")
local user = require("src.models.User")
local db = require("lapis.db")

local field = {
	criar = function(data)
		local f = Field:create(
			{
				title             = data.title,
				data              = data.data,
				token_iot         = data.token_iot,
				date_time         = data.date_time,
				registration_user = user.pesquisar_token(data.token_iot)
			}
		)
		if f then
			return true
		end
		return false
	end,

	visulizar_titulos = function(userID)
		local f = db.query(
			"SELECT DISTINCT ON (a.title) a.title FROM public.data a WHERE registration_user=?",
			userID)
		if f then
			return f
		end
		return false
	end,

	visulizar_dados = function(userID, title)
		local f = db.query(
			"SELECT a.data, a.date_time, a.title FROM public.data a WHERE registration_user=? AND title=? ORDER BY id DESC LIMIT 20",
			userID,
			title)
		if f then
			return f
		end
		return false
	end
}

return field