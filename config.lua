local config = require("lapis.config")

config("development", {
  server = "nginx",
  port = 8080,
  bind_host = "0.0.0.0",
  code_cache = "off",
  num_workers = "1",
  session_name = "IoT Recieve",
  secret = "Tudo começa com erros e acertos ",
})
