local api = require("src.infra.suap.SuapApi")
-- local user_db = require("src.models.User")

local index = {

    login = function(self, data)
       
        -- faz a verificação de login pelo suap, usando o logi/matricula e a senha de acesso do suap
        local tokens = api.tokens(data.username, data.password)
        
        -- verifica se existe o token de acesso
        if tokens.access then

            -- pedir informações do usuário para a api do suap
            local userData = api.dataUser(tokens.access, api.tokens_refrash(tokens.refresh).access)

            -- verifia se o usuário está matriculado
            if (userData.situacao == "Matriculado no SUAP") then

                -- salvar informações na sessão do usuário
                self.session.user = {
                    userName    = userData.apelido,
                    matricula   = userData.matricula
                }
                print("\n\nmatricula="..userData.matricula.."\nnome="..userData.nome.."\napelido="..userData.apelido.."\n\n")

                -- if not user_db.visualizar_dados(userData.matricula) then 
                --     user_db.criar({
                --         name = userData.nome,
                --         nickname = userData.apelido,
                --         registration = userData.matricula
                --     })
                -- end

                return {    redirect_to = "/"}
            end
        end
        return {
            redirect_to = "login"
        }
    end,

    verifier = function(self)

        if self.session.user then
            return true
        end
        return false
    end
}

return index
