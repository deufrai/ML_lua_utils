-- print target on LiveView when zoomed 10x

-- lvzoomch - Magic Lantern LUA script that prints a "target" on center of LiveView when zoomed 10x
-- Copyright (C) 2018  Frédéric CORNU
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- ou should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

function draw_target()

    local CIRCLE_RADIUS = 5
    local DISPLAY_HEIGHT = display.height
    local DISPLAY_WIDTH = display.width
    local DISPLAY_CENTER_X = DISPLAY_WIDTH / 2
    local DISPLAY_CENTER_Y =  DISPLAY_HEIGHT / 2
    local SPACING = 10
    local TARGET_COLOR = COLOR.GREEN1

    if MODE.MOVIE ~= camera.mode and false == menu.visible and true == lv.enabled then

        -- avoid redrawing when not needed
        -- for this, we check the color of the central pixel
        if TARGET_COLOR ~= display.pixel(DISPLAY_CENTER_X, DISPLAY_CENTER_Y) then

            -- display center point
            display.pixel(DISPLAY_CENTER_X, DISPLAY_CENTER_Y, TARGET_COLOR)

            -- display a circle on center of display
            display.circle(
                DISPLAY_CENTER_X,
                DISPLAY_CENTER_Y,
                CIRCLE_RADIUS,
                TARGET_COLOR
            )

            -- display crosshair
            display.line(
                DISPLAY_CENTER_X,
                0,
                DISPLAY_CENTER_X,
                DISPLAY_CENTER_Y - (CIRCLE_RADIUS + SPACING),
                TARGET_COLOR
            )

            display.line(
                DISPLAY_CENTER_X,
                DISPLAY_HEIGHT,
                DISPLAY_CENTER_X,
                DISPLAY_CENTER_Y + (CIRCLE_RADIUS + SPACING),
                TARGET_COLOR
            )

            display.line(
                0,
                DISPLAY_CENTER_Y,
                DISPLAY_CENTER_X - (CIRCLE_RADIUS + SPACING),
                DISPLAY_CENTER_Y,
                TARGET_COLOR
            )

            display.line(
                DISPLAY_WIDTH,
                DISPLAY_CENTER_Y,
                DISPLAY_CENTER_X + (CIRCLE_RADIUS + SPACING),
                DISPLAY_CENTER_Y,
                TARGET_COLOR
            )
        end
    end
end

event.seconds_clock = function(arg)

    draw_target()

    return true
end
