return function(self)
    local data = {
        {
            name = "field 1",
            data = { 1, 1, 1, 1, 1 }
        }
    }

    for i = 2, 20, 1 do
        table.insert(data,
            {
                name = "field " .. i,
                data = { i, i, i, i, i }
            })
    end


    return { json = { data } }
end
