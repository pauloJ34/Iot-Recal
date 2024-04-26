local schema = require("lapis.db.schema")

local types = schema.types

schema.create_table("data-use", {
	{ "id", types.serial },
	{ "id_data", types.serial },
	{ "registration_user", types.varchar },

	"PRIMARY KEY (id)",
	'FOREIGN KEY (id_data) REFERENCES data(id)',
	"FOREIGN KEY(registration_user) REFERENCES users(registration)"
})
