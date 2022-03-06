local clockify = require('clockify_nvim.clockify')

describe("greeting", function()
   it('works!', function()
      assert.combinators.match("Hello Gabo", clockify.greeting("Gabo"))
   end)
end)

