local bson = require "bson"
local cjson = require "cjson"
local tinsert = table.insert

local mt = {}
mt.__index = mt

--- 绘制线段
--- line(color, x1, y1, x2, y2 [,...])
--- line(x1, y1, x2, y2 [, ...])
function mt:line(x1, y1, x2, y2, ...)
    local color
    local points = {...}
    if #points % 2 == 0 then
        -- 默认颜色
        assert(x1, "x1")
        assert(y1, "y1")
        assert(x2, "x2")
        assert(y2, "y2")
        tinsert(points, 1, y2)        
        tinsert(points, 1, x2)        
        tinsert(points, 1, y1)        
        tinsert(points, 1, x1)        
    else
        -- 指定颜色
        color = x1
        tinsert(points, 1, y2)        
        tinsert(points, 1, x2)        
        tinsert(points, 1, y1)
    end
    tinsert(self.lines, {
        color = color,
        points = points,
    })
end

function mt:rect(x, y, w, h, param)
    local color
    if param then
        color = x
        x = y
        y = w
        w = h
        h = param
    end
    tinsert(self.rects, {
        color = color,
        x = x,
        y = y,
        w = w,
        h = h,
    })
end

function mt:write(filename)
    local ret = cjson.encode(self)
    print("ret:", ret)
    local f = io.open(filename, 'w')
    f:write(ret)
    f:close()
    print("written to "..filename)
end

local M = {}

function M.new(width, heigh, title)
    local obj = {
        width = width,
        heigh = heigh,
        title = title,

        lines = {},
        rects = {},
    }
    return setmetatable(obj, mt)
end

return M