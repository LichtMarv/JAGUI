jag = {}

function jag:init()
    self.screen = peripheral.find("monitor")
    if self.screen == nil then
        self.screen = term
    end
    self.width, self.height = self.screen.getSize()
    self.frameCounter = 0
    os.startTimer(0.1)
    while true do
        os.pullEvent("timer")
        jag:clear()
        jag:draw()
        jag:postUpdate()
        os.startTimer(0.3)
    end
end

function jag:clear()
    self.screen.clear()
    self.screen.setCursorPos(1, 1)
end

function jag:postUpdate()
    self.frameCounter = self.frameCounter + 1
    self.screen.setBackgroundColor(colors.black)
end

function jag:background(color, clear)
    self.screen.setBackgroundColor(color)
    if clear then
        self.screen.clear()
    end
end

function jag:color(col)
    self.screen.setTextColor(col)
    self.currentColor = col
end

function jag:drawRect(t, l, b, r)
    local c = self.screen.getBackgroundColor()
    self:background(self.currentColor, false)
    local x1 = l / 100 * self.width
    local y1 = t / 100 * self.height
    local x2 = r / 100 * self.width
    local y2 = b / 100 * self.height
    local w = self.width - (x1 + x2)
    local h = self.height - (y1 + y2)
    for i = y1, y1 + h + 1, 1 do
        self.screen.setCursorPos(x1, i)
        for j = x1, x1 + w + 1, 1 do
            self.screen.write(" ")
        end
    end
    self:background(c, false)
end

function jag:drawText(text, color)
    self.screen.setTextColor(color)
    self.screen.write(text)
end

return jag
