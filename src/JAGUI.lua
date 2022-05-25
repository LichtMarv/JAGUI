jag = {}

function jag:init()
    self.screen = peripheral.find("monitor")
    if self.screen == nil then
        self.screen = term
    end
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

function jag:drawText(text, color)
    self.screen.setTextColor(color)
    self.screen.write(text)
end

return jag
