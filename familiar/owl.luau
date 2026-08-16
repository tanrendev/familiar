local SPRITE = "sprites/owl-%s-%s.png"
local IDLE = { "open", 250 }
local ANIMS = {
    blink = { { "blink1", 60 }, { "blink2", 140 }, { "blink1", 60 } },
    hop = { { "hop1", 120 }, { "hop2", 160 }, { "hop1", 120 } },
}
local TIMING = { blink = { 12, 80 }, hop = { 80, 320 } }
local DOUBLE_BLINK_GAP = { "open", 180 }

local lastFrame, lastMode = "", ""
local lastInterval = 0
local queue = {}
local timers = {}

math.randomseed(os.time())

local function arm(name)
    timers[name] = math.random(TIMING[name][1], TIMING[name][2])
end

arm("blink")
arm("hop")

local function show(frame, interval)
    if interval ~= lastInterval then
        lastInterval = interval
        noctalia.setUpdateInterval(interval)
    end
    local mode = noctalia.isDarkMode() and "dark" or "light"
    if frame ~= lastFrame or mode ~= lastMode then
        lastFrame, lastMode = frame, mode
        barWidget.setImage(SPRITE:format(frame, mode), false, 32, 32)
    end
end

local function play(name)
    queue = table.clone(ANIMS[name])
end

function update()
    if #queue == 0 then
        timers.blink = timers.blink - 1
        timers.hop = timers.hop - 1
        if timers.hop <= 0 then
            arm("hop")
            play("hop")
        elseif timers.blink <= 0 then
            arm("blink")
            play("blink")
            if math.random(4) == 1 then
                queue[#queue + 1] = DOUBLE_BLINK_GAP
                table.move(ANIMS.blink, 1, #ANIMS.blink, #queue + 1, queue)
            end
        end
    end
    local f = table.remove(queue, 1) or IDLE
    show(f[1], f[2])
end
