local api = require("src.infra.suap.SuapApi")
return function(self)
    local username = self.params.username
    local password = self.params.password

    local tokens = api.tokens(username, password)
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
    if tokens.access then
        local userData = api.dataUser(tokens.access)
        print("\n\n>>>>>>>>>>>>>> logado <<<<<<<<<<<<<<,\n\n")

        return { json = { userData } }
        -- return { redirect_to = "/" }
    end
    --[[

    ]]
    --
    return { json = { tokens } }
end
