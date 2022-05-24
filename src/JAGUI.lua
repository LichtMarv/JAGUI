jag = {}

function jag:init()
    self.screen = peripheral.find("monitor")
    if self.screen == nil then
        self.screen = term
    end
end

function jag:drawText(text)
    self.screen.write(text)
end

return jag
