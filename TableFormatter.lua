--[[
************************************************************************
*  NAME:          TableFormatter.lua
*
*  PURPOSE:       Lua table pretty-printer
*
*  SUPPORT:       Phil Hanna
*
*  USAGE:         local tf = require("TableFormatter")
*                 print(tf.tostring(sometable))
*
*  NOTES:         Defines several local functions that support the 
*                 main one, which is tostring().  Only tostring() is
*                 visible to callers
*
************************************************************************
--]]
local M = {}

-- Given an indentation level, returns a string of three times that many spaces

local function getIndent(indent)
   return string.rep("   ", indent) 
end

-- Formats a table key as either a value in square brackets
-- or, if the key is a string, as a bare value

local function keyAsString(k)
   if type(k) == 'string' then
      return k;
   else
      return '[' .. tostring(k) .. ']'
   end
end

-- Formats a table value as either a simple value
-- or, if the value is a string, as a quoted string

local function valueAsString(v)
   if type(v) == 'string' then
      return '"' .. tostring(v) .. '"';
   else
      return tostring(v)
   end
end

-- Recursive local function that performs the formatting

local function _tostring(t, indent)
   indent = indent or 0
   local sb = '{'
   local entryNumber = 0
   for k,v in pairs(t) do
      entryNumber = entryNumber + 1
      if (entryNumber > 1) then
         sb = sb .. ','
      end
      sb = sb .. '\n' .. getIndent(indent + 1)
      sb = sb .. keyAsString(k) .. ' = '
      if type(v) == 'table' then
         sb = sb .. _tostring(v, indent+1)
      else
         sb = sb .. valueAsString(v)
      end
   end
   sb = sb .. '\n' .. getIndent(indent) .. "}"
   return sb
end

-- Main function

function M.tostring(t)
   return _tostring(t)
end

return M
