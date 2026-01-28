local field = require("src.models.Field")

local function reverse(arr)
	local i, j = 1, #arr
	while i < j do
		arr[i], arr[j] = arr[j], arr[i]
		i = i + 1
		j = j - 1
	end
end

return function(self)
	local matricula = self.params.matricula

	local field_list = field.visulizar_titulos(matricula)
	local list_title = {}
	local list_data = {}
	local data = {}
	local a = {}
	local count = 0

	if field_list then
		for i, v in pairs(field_list) do
			for y, x in pairs(v) do
				table.insert(list_title, x)
				--print("\n\n" .. x .. "\n\n")
			end
		end
	end

	for i, v in ipairs(list_title) do
		--print("\n\n" .. v)
		local field_list_data = field.visulizar_dados(matricula, v)
		if field_list_data then
			-- a = field_list_data
			for y, x in pairs(field_list_data) do
				-- print("\n\n"..x.id.." "..x.data.."\n\n")
				-- print("\n\n" .. y .. "\n\n")
				if list_data[count] then
					--print("\n\n\n" .. x .. "\n\n\n")
					table.insert(list_data[count].data, x.data)
					table.insert(list_data[count].time, x.date_time)
					--table.insert(list_data[count].date, x.date)
				else
					table.insert(list_data, count, {
						title = x.title,
						data = { x.data },
						time = { x.date_time },
						--date = { x.date }
					})
				end
				--for index, value in pairs(x) do
				--	print("\n\n" .. v .. " " .. value .. " " .. "\n\n")
				--end
			end

			count = count + 1
		end
	end
	--print("\n\n" .. list_data[0].time .. "\n\n")

	for index, value in pairs(list_data) do
		--print("\n\n" .. value.hora .. "\n\n")
		local a = value.time
		for x, y in ipairs(a) do
			print("\n\n----" .. y .. "\n\n")
		end
		table.insert(data, index, {
			name = value.title,
			column = value.time,
			data = value.data,
			--date = value.date
		})

		if (data[index].column) then
			reverse(data[index].column)
		end

		if (data[index].data) then
			reverse(data[index].data)
		end
	end

	-- 	print("\n\n id " .. index)
	-- 	for i, v in pairs(value) do
	-- 		print(" " .. i .. " " .. v.."\n\n")
	-- 	end


	-- 	-- for i, v in pairs(value) do
	-- 	-- end
	-- end
	return { json = { data } }
end
-- metodo para teste de inserir dados
--return function(self)
-- 	math.randomseed(os.time())

-- 	local min = 0
-- 	local max = 100
-- 	local data = { {
-- 		name = "field-1",
-- 		data = {
-- 			math.random(min, max),
-- 			math.random(min, max),
-- 			math.random(min, max),
-- 			math.random(min, max),
-- 			math.random(min, max),
-- 			math.random(min, max),
-- 			math.random(min, max) },
-- 		column = {
-- 			2 .. ":" .. 10 .. "h",
-- 			3 .. ":" .. 10 .. "h",
-- 			4 .. ":" .. 10 .. "h",
-- 			5 .. ":" .. 10 .. "h",
-- 			6 .. ":" .. 10 .. "h",
-- 			7 .. ":" .. 10 .. "h",
-- 			8 .. ":" .. 10 .. "h" }
-- 	} }

-- 	for i = 2, 20, 1 do
-- 		table.insert(data, {
-- 			name = "field-" .. i,
-- 			data = {
-- 				math.random(min, max),
-- 				math.random(min, max),
-- 				math.random(min, max),
-- 				math.random(min, max),
-- 				math.random(min, max),
-- 				math.random(min, max),
-- 				math.random(min, max) },
-- 			column = {
-- 				2 .. ":" .. 10 .. "h",
-- 				3 .. ":" .. 10 .. "h",
-- 				4 .. ":" .. 10 .. "h",
-- 				5 .. ":" .. 10 .. "h",
-- 				6 .. ":" .. 10 .. "h",
-- 				7 .. ":" .. 10 .. "h",
-- 				8 .. ":" .. 10 .. "h" }
-- 		})
-- 	end

-- 	return { json = { data } }
-- end