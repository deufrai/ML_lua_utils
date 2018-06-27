event.keypress = function(key)

    if KEY.ZOOMIN == key and MODE.MOVIE ~= camera.mode and false == menu.visible then

        if true == lv.enabled and 10 == lv.zoom then

            display.circle(

                display.width / 2,
                display.height / 2,
                10,
                COLOR.WHITE

            )
        end
    end
end