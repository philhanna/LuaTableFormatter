#! /usr/bin/lua

local tf = require("TableFormatter")
local t = {
   1,
   track = "Belmont",
   "2",
   squared = function(x)
      return x*x
   end,
   {
      nested = true,
      {
         Captain = "Sisko",
         FirstOfficer = "Kira",
         ScienceOfficer = "Dax"
      },
      middle = true,
   },
   "buckle my shoe",
}

print(tf.tostring(t))
