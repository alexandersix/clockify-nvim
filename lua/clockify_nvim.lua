local clockify = require("clockify_nvim.clockify")

local clockify_nvim = {}

local function with_defaults(options)
   return {
      name = options.name or "John Doe"
   }
end

function clockify_nvim.setup(options)
   -- avoid setting global values outside of this function. Global state
   -- mutations are hard to debug and test, so having them in a single
   -- function/moduler makes it easier to reason about all possible changes
   clockify_nvim.options = with_defaults(options)

   -- do here any startup your plugin needs

   -- this is also a good place for creating mappings
end

function clockify_nvim.is_configured()
   return clockify_nvim.options ~= nil
end

-- this is some function that will be used outside this plugin code. Think of it
-- as a public API
function clockify_nvim.greet()
   if not clockify_nvim.is_configured() then
      return
   end

   -- try to keep all the heavy logic on pure functions/modules that does not
   -- depend on neovim APIs because this makes them easy to test
   local greeting = clockify.greeting(clockify_nvim.options.name)
   vim.api.nvim_echo({ { greeting } }, false, {})
end

clockify_nvim.options = nil
return clockify_nvim
