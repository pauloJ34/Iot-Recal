local schema = require("lapis.db.schema")

local types = schema.types

schema.create_table("users", {
	{ "registration", 	types.varchar },
	{ "name", 					types.varchar },
	{ "nickname", 			types.varchar },

	"PRIMARY KEY (registration)",
})
