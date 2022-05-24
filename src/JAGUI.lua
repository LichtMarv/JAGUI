function init()
    screen = peripheral.find("monitor")
    if screen == nil then
        screen = term
    end
end

jag = {}

function jag.drawText(text)
    screen.write(text)
end

return jag
