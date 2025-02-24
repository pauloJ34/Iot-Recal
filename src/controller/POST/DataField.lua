return function(self)
    local min = 5
    local max = 50
    local data = {{
        name = "field 1",
        data = {math.random(min,100), math.random(min,max), math.random(min,max), math.random(min,max), math.random(min,max)},
        column= {2 .. ":" .. 10 .. "h", 3 .. ":" .. 10 .. "h", 4 .. ":" .. 10 .. "h", 5 .. ":" .. 10 .. "h", 6 .. ":" .. 10 .. "h"}
    }}

    for i = 2, 20, 1 do
        table.insert(data, {
            name = "field " .. i,
            data = {math.random(min,max), math.random(min,max), math.random(min,max), math.random(min,max), math.random(min,max)},
            column= {2 .. ":" .. 10 .. "h", 3 .. ":" .. 10 .. "h", 4 .. ":" .. 10 .. "h", 5 .. ":" .. 10 .. "h", 6 .. ":" .. 10 .. "h"}
        })
    end

    return {
        json = {data}
    }
end
