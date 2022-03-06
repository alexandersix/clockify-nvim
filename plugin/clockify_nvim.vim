let s:clockify_nvim = luaeval('require("clockify_nvim")')

if s:clockify_nvim.is_configured()
  " Neovim does not expose a lua API to create commands yet
  command! MyPluginGreet call s:clockify_nvim.greet()
endif
