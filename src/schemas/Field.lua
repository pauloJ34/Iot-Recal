local schema = require("lapis.db.schema")

local types = schema.types

schema.create_table("data", {
	{ "id", types.serial },
	{ "title", types.varchar },
	{ "data", types.varchar },
	{ "time", types.time },
	{ "date", types.date },

	"PRIMARY KEY (id)",
})
