jag = {}

function jag:init()
    self.screen = peripheral.find("monitor")
    if self.screen == nil then
        self.screen = term
    end
    self.counter = 0
    while true do
        jag:clear()
        jag:draw()
        jag:postUpdate()
    end
end

function jag:clear()
    self.screen.clear()
    self.screen.setCursorPos(1, 1)
end

function jag:postUpdate()
    self.counter = self.counter + 1
end

function jag:drawText(text)
    self.screen.write(text)
end

return jag
