local lapis = require("lapis")
local inspect = require('inspect')
local app = lapis.Application()

local app_data = {}

app:get("/", function()
  return "<h1>Welcome to Ty's ISE 500 Demo</h1>"
end)


app:get("all_data", "/data", function()
    return "Data: <br />" .. tostring(inspect(app_data))
end)

app:get("clear", "/clear", function(self)
    app_data = {}
    return { redirect_to = self:url_for("all_data") }
end)

app:post("post_data", "/post", function(self)
    -- Keep the data from the post request
    app_data[tostring(os.time())] = self.params
    return { redirect_to = self:url_for("all_data") }
end)

return app
