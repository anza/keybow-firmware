require "keybow"

--require "snippets/morekeys"

keybow.KPSLASH = 0x54
keybow.KPASTERISK = 0x55
keybow.KPMINUS = 0x56
keybow.KPPLUS = 0x57
keybow.KPENTER = 0x58
keybow.KP1 = 0x59
keybow.KP2 = 0x5a
keybow.KP3 = 0x5b
keybow.KP4 = 0x5c
keybow.KP5 = 0x5d
keybow.KP6 = 0x5e
keybow.KP7 = 0x5f
keybow.KP8 = 0x60
keybow.KP9 = 0x61
keybow.KP0 = 0x62
keybow.KPDOT = 0x63
keybow.KPEQUAL = 0x67

-- Extended numberpad with light feedback --
-- key 0 (bottom left) used as modifier (shift) key
-- -- key 1 produces zero, or a dot (.) with the modifier pressed down
-- -- key 2: TAB, or ENTER with the modifier

function sleep(s)
    local t = tonumber(os.clock() + s)
    while os.clock() < t do end
end

function initlights()
    for pix = 0,11 do
        keybow.set_pixel(pix, 255, 255, 255)
        sleep(1)
        keybow.set_pixel(pix, 0, 0, 0)
    end
    sleep(1)
    keybow.set_pixel(0, 0, 255, 0)
    sleep(0.5)
    keybow.set_pixel(3, 0, 255, 0)
    sleep(0.2)
    keybow.set_pixel(6, 0, 255, 0)
    sleep(0.1)
    keybow.set_pixel(9, 0, 255, 0)

end

function setup()
    keybow.auto_lights(false)
    keybow.clear_lights()
    initlights()
end

-- Key mappings --

-- we set our own internal modifier variable;
-- this has nothing to do with sending out a "modifier key pressed signal"
modifier = false

function handle_key_00(pressed)
    if pressed then
        modifier = true
        keybow.set_pixel(1, 255, 255, 255)
        keybow.set_pixel(2, 255, 255, 255)
        keybow.set_pixel(08, 255, 0, 0)
        keybow.set_pixel(09, 255, 0, 255)
        keybow.set_pixel(10, 255, 255, 0)
        keybow.set_pixel(11, 0, 0, 255)
    else
        modifier = false
        keybow.set_pixel(0, 0, 0, 0)
        keybow.set_pixel(1, 0, 0, 0)
        keybow.set_pixel(2, 0, 0, 0)
        keybow.set_pixel(08, 0, 0, 0)
        keybow.set_pixel(09, 0, 0, 0)
        keybow.set_pixel(10, 0, 0, 0)
        keybow.set_pixel(11, 0, 0, 0)
    end
end

function handle_key_01(pressed)
    if modifier == true then
        keybow.set_key(keybow.KPDOT, pressed)
    else
        keybow.set_key(keybow.KP0, pressed)
    end

    if pressed then
        if modifier == true then
            keybow.set_pixel(1, 0, 0, 0)
        else
            keybow.set_pixel(1, 255, 255, 255)
        end
    else
        keybow.release_key(keybow.KPDOT)
        keybow.release_key(keybow.KP0)
        if modifier == true then
            keybow.set_pixel(1, 255, 255, 255)
        else
            keybow.set_pixel(1, 0, 0, 0)
        end
    end
end

function handle_key_02(pressed)
    if modifier == true then
        keybow.set_key(keybow.ENTER, pressed)
    else
        keybow.set_key(keybow.TAB, pressed)
    end

    if pressed then
        if modifier == true then
            keybow.set_pixel(2, 0, 0, 0)
        else
            keybow.set_pixel(2, 255, 255, 255)
        end
    else
        keybow.release_key(keybow.ENTER)
        keybow.release_key(keybow.TAB)
        if modifier == true then
            keybow.set_pixel(2, 255, 255, 255)
        else
            keybow.set_pixel(2, 0, 0, 0)
        end
    end
end

function handle_key_03(pressed)
    keybow.set_key("1", pressed)
    if pressed then
        keybow.set_pixel(3, 255, 255, 255)
    else
        keybow.set_pixel(3, 0, 0, 0)
    end
end

function handle_key_04(pressed)
    keybow.set_key("2", pressed)
    if pressed then
        keybow.set_pixel(4, 255, 255, 255)
    else
        keybow.set_pixel(4, 0, 0, 0)
    end
end

function handle_key_05(pressed)
    keybow.set_key("3", pressed)
    if pressed then
        keybow.set_pixel(5, 255, 255, 255)
    else
        keybow.set_pixel(5, 0, 0, 0)
    end
end

function handle_key_06(pressed)
    keybow.set_key("4", pressed)
    if pressed then
        keybow.set_pixel(6, 255, 255, 255)
    else
        keybow.set_pixel(6, 0, 0, 0)
    end
end

function handle_key_07(pressed)
    keybow.set_key("5", pressed)
    if pressed then
        keybow.set_pixel(7, 255, 255, 255)
    else
        keybow.set_pixel(7, 0, 0, 0)
    end
end

function handle_key_08(pressed)
    if modifier == true then
        keybow.set_key(keybow.KPPLUS, pressed)
    else
        keybow.set_key("6", pressed)
    end

    if pressed then
        if modifier == true then
            keybow.set_pixel(08, 0, 0, 0)
        else
            keybow.set_pixel(08, 255, 255, 255)
        end
    else
        keybow.release_key(keybow.KPPLUS)
        keybow.release_key("6")
        if modifier == true then
            keybow.set_pixel(08, 255, 0, 0)
        else
            keybow.set_pixel(08, 0, 0, 0)
        end
    end
end

function handle_key_09(pressed)
    if modifier == true then
        keybow.set_key(keybow.KPSLASH, pressed)
    else
        keybow.set_key("7", pressed)
    end

    if pressed then
        if modifier == true then
            keybow.set_pixel(09, 0, 0, 0)
        else
            keybow.set_pixel(09, 255, 255, 255)
        end
    else
        keybow.release_key(keybow.KPSLASH)
        keybow.release_key("7")
        if modifier == true then
            keybow.set_pixel(09, 255, 0, 255)
        else
            keybow.set_pixel(09, 0, 0, 0)
        end
    end
end

function handle_key_10(pressed)
    if modifier == true then
        keybow.set_key(keybow.KPASTERISK, pressed)
    else
        keybow.set_key("8", pressed)
    end

    if pressed then
        if modifier == true then
            keybow.set_pixel(10, 0, 0, 0)
        else
            keybow.set_pixel(10, 255, 255, 255)
        end
    else
        keybow.release_key(keybow.KPASTERISK)
        keybow.release_key("8")
        if modifier == true then
            keybow.set_pixel(10, 255, 255, 0)
        else
            keybow.set_pixel(10, 0, 0, 0)
        end
    end
end

function handle_key_11(pressed)
    if modifier == true then
        keybow.set_key(keybow.KPMINUS, pressed)
    else
        keybow.set_key("9", pressed)
    end

    if pressed then
        if modifier == true then
            keybow.set_pixel(11, 0, 0, 0)
        else
            keybow.set_pixel(11, 255, 255, 255)
        end
    else
        keybow.release_key(keybow.KPMINUS)
        keybow.release_key("9")
        if modifier == true then
            keybow.set_pixel(11, 0, 0, 255)
        else
            keybow.set_pixel(11, 0, 0, 0)
        end
    end
end
