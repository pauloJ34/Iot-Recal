local codes = {
	not_key  = {
		status = 400,
		json = {
			status = 400,
			message = "Não possui o parametro 'key', ou o parametro 'key' está errado!",
		}
	},
	user_err = {
		status = 401,
		json = {
			status = 401,
			message = "Usuário não autenticado ou não autorizado"
		}

	}
}
return codes