require "keybow"

-- Extended numberpad with light feedback --
-- key 0 (bottom left) used as modifier (shift) key
-- -- key 1 produces zero, or a dot (.) with the modifier pressed down
-- -- key 2: TAB, or ENTER with the modifier

function setup()
    keybow.auto_lights(false)
    keybow.clear_lights()
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
    else
        modifier = false
        keybow.set_pixel(1, 0, 0, 0)
        keybow.set_pixel(2, 0, 0, 0)
    end
end

function handle_key_01(pressed)
    if modifier == true then
        keybow.set_key(".", pressed)
    else
        keybow.set_key("0", pressed)
    end

    if pressed then
        if modifier == true then
            keybow.set_pixel(1, 0, 0, 0)
        else
            keybow.set_pixel(1, 255, 255, 255)
        end
    else
        keybow.release_key(".")
        keybow.release_key("0")
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
    keybow.set_key("6", pressed)
    if pressed then
        keybow.set_pixel(8, 255, 255, 255)
    else
        keybow.set_pixel(8, 0, 0, 0)
    end
end

function handle_key_09(pressed)
    keybow.set_key("7", pressed)
    if pressed then
        keybow.set_pixel(9, 255, 255, 255)
    else
        keybow.set_pixel(9, 0, 0, 0)
    end
end

function handle_key_10(pressed)
    keybow.set_key("8", pressed)
    if pressed then
        keybow.set_pixel(10, 255, 255, 255)
    else
        keybow.set_pixel(10, 0, 0, 0)
    end
end

function handle_key_11(pressed)
    keybow.set_key("9", pressed)
    if pressed then
        keybow.set_pixel(11, 255, 255, 255)
    else
        keybow.set_pixel(11, 0, 0, 0)
    end
end
