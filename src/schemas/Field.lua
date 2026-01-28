local schema = require("lapis.db.schema")

local types = schema.types

schema.create_table("data", {
	{ "id",                types.serial },
	{ "title",             types.varchar },
	{ "data",              types.varchar },
	{ "date_time",         types.time },
	{ "registration_user", types.varchar },
	{ "token_iot",         types.varchar },
	{ "MAC_IOT",           types.varchar({ null = true }) },

	"PRIMARY KEY (id)",
	"FOREIGN KEY(registration_user) REFERENCES users(registration)",
	"FOREIGN KEY(token_iot) REFERENCES users(token)",
})