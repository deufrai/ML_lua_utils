function draw_target()

    display.circle(

        display.width / 2,
        display.height / 2,
        10,
        COLOR.WHITE

    )
end

event.keypress = function(key)

    if KEY.ZOOMIN == key and MODE.MOVIE ~= camera.mode and false == menu.visible then

        if true == lv.enabled and 5 == lv.zoom then

            draw_target()
        end

        while 10 == lv.zoom do

            draw_target()
        end
    end

    return true
end