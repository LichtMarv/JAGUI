function init()
    screen = peripheral.find("monitor")
    if screen == nil then
        screen = term
    end
end

function drawText(text)
    screen.write(text)
end
