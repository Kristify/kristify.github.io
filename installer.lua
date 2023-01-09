if not http then
    error("Holdup. How- eh whatever. You need the http API!")
end

local authenticate = _G._GIT_API_KEY and {Authorization = "Bearer ".._G._GIT_API_KEY}
local response,err,errResp = http.get("https://raw.githubusercontent.com/Kristify/kristify/main/installer.lua",authenticate)

if not response then
    error("Couldn't get the install script! Reason: \'"..err.."\' (code "..errResp.getResponseCode()..')')
end

local content = response.readAll()
response.close()

load(content, "install",'t',_ENV)()