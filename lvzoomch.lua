-- print target on zoomed LiveView

function draw_target()

    -- display a 5px radious circle on center of display
    display.circle(

        display.width / 2,
        display.height / 2,
        5,
        COLOR.GREEN1

    )
end

event.keypress = function(key)

    if KEY.ZOOMIN == key and MODE.MOVIE ~= camera.mode and false == menu.visible then

        --[[
            We want our target to appear when we are zoomed 10x so we check
            if zoom key is pressed when we currently are zoomed 5x
        --]]
        if true == lv.enabled and 5 == lv.zoom then

            display.draw(draw_target)
        end
    end

    return true
end