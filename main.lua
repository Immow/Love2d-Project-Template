Default = love.graphics.getFont()

TSerial  = require("libs.TSerial")
TPrint   = require("libs.TPrint")
Lib      = require("libs.lib")
Settings = require("settings")
Colors   = require("libs.colors")
Timer    = require("libs.timer")
Sound    = require("libs.sounds")
State    = require("state.state")
Flux     = require("libs.flux")

function love.load()
	State:load()
	--Sound:play("music", "music", Settings.musicVolume, 1, true)
end

function love.update(dt)
	State:update(dt)
	Timer.updateAll(dt)
	Flux.update(dt)
end

function love.draw()
	love.graphics.setFont(Default)
	State:draw()
end

function love.keypressed(key,scancode,isrepeat)
	State:keypressed(key,scancode, isrepeat)
end

function love.keyreleased(key,scancode)
	State:keyreleased(key,scancode)
end

function love.mousepressed(x,y,button,istouch,presses)
	State:mousepressed(x,y,button,istouch,presses)
end

function love.mousereleased(x,y,button,istouch,presses)
	State:mousereleased(x,y,button,istouch,presses)
end

function love.mousemoved(x, y, dx, dy, istouch)
	State:mousemoved(x, y, dx, dy, istouch)
end

function love.touchpressed(id,x,y,dx,dy,pressure)
	State:touchpressed(id,x,y,dx,dy,pressure)
end

function love.touchreleased(id,x,y,dx,dy,pressure)
	State:touchreleased(id,x,y,dx,dy,pressure)
end

function love.touchmoved(id,x,y,dx,dy,pressure)
	State:touchmoved(id,x,y,dx,dy,pressure)
end

function love.wheelmoved(x, y)
	State:wheelmoved(x,y)
end

function love.textinput(t)
	State:textinput(t)
end

function love.focus(f)
	if f then
		Settings.focused = true
	else
		Settings.focused = false
	end
end

function love.quit()
	
end
