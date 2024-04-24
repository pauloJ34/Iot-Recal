local api = require("src.infra.suap.SuapApi")

local index = {
    login =
        function(self, data)
            --[[
            -- parametros da tabela
                tokens      --aceito
                {
                    refresh
                    access
                }
                tokens      --não aceito
                {
                    detail
                }
                userData{
                    situacao_sistemica
                    matricula
                    matricula_regular
                    linha_pesquisa
                    curriculo_lattes
                    nome
                    curso
                    campus
                    situacao
                    cota_sistec
                    cota_mec
                }
            ]]
            local tokens = api.tokens(data.username, data.password)

            if tokens.access then
                local userData = api.dataUser(tokens.access)

                if (userData.vinculo.situacao == "Matriculado")
                then
                    self.session.user = {
                        userName = userData.nome_usual
                    }
                    return { redirect_to = "/" }
                end
            end
            return { redirect_to = "login" }
        end,

    verifier =
    -- render representa o arquivo na pasta view
        function(self)
            if self.session.user then
                return true
            end
            return false
        end
}

return index
