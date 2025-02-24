local config = require("lapis.config")

config("development", {
	-- postgres = {
	-- 	host = "127.0.0.1",
	-- 	user = "postgres",
	-- 	password = "postgres",
	-- 	database = "postgres"
	-- },
  -- server = "cqueues",
  port = 8080,
  bind_host = "0.0.0.0",
  code_cache = "off",
  num_workers = "1",
  session_name = "IoT Recieve",
  secret = "Tudo começa com erros e acertos ",
	-- logging = false,
})
