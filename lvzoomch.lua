-- print target on zoomed LiveView

function draw_target()

    local CIRCLE_RADIUS = 5
    local DISPLAY_CENTER_X = display.width / 2
    local DISPLAY_CENTER_Y = display.height / 2
    local SPACING = 10
    local SEGMENT_LENGTH = 20
    local TARGET_COLOR = COLOR.GREEN1

    --[[
        We want our target to appear when we are zoomed 10x so we check
        if zoom key is pressed when we currently are zoomed 5x
     --]]

    if MODE.MOVIE ~= camera.mode and false == menu.visible and true == lv.enabled and 10 == lv.zoom then

        -- display a 5px radius circle on center of display
        display.circle(
            DISPLAY_CENTER_X,
            DISPLAY_CENTER_Y,
            CIRCLE_RADIUS,
            TARGET_COLOR
        )

        -- display crosshair
        display.line(
            DISPLAY_CENTER_X,
            DISPLAY_CENTER_Y - (CIRCLE_RADIUS + SPACING + SEGMENT_LENGTH),
            DISPLAY_CENTER_X,
            DISPLAY_CENTER_Y - (CIRCLE_RADIUS + SPACING),
            TARGET_COLOR
        )

        display.line(
            DISPLAY_CENTER_X,
            DISPLAY_CENTER_Y + (CIRCLE_RADIUS + SPACING + SEGMENT_LENGTH),
            DISPLAY_CENTER_X,
            DISPLAY_CENTER_Y + (CIRCLE_RADIUS + SPACING),
            TARGET_COLOR
        )

        display.line(
            DISPLAY_CENTER_X - (CIRCLE_RADIUS + SPACING + SEGMENT_LENGTH),
            DISPLAY_CENTER_Y,
            DISPLAY_CENTER_X - (CIRCLE_RADIUS + SPACING),
            DISPLAY_CENTER_Y,
            TARGET_COLOR
        )

        display.line(
            DISPLAY_CENTER_X + (CIRCLE_RADIUS + SPACING + SEGMENT_LENGTH),
            DISPLAY_CENTER_Y,
            DISPLAY_CENTER_X + (CIRCLE_RADIUS + SPACING),
            DISPLAY_CENTER_Y,
            TARGET_COLOR
        )
    end

end

event.seconds_clock = function(arg)

    draw_target()

    return true
end