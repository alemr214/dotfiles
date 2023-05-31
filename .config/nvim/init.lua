require("alemr.base")
require("alemr.highlights")
require("alemr.maps")
require("alemr.plugins")

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac == 1 then
  require('alemr.macos')
end
if is_win == 1 then
  require('alemr.windows')
end
if is_wsl == 1 then
  require('alemr.wsl')
end
