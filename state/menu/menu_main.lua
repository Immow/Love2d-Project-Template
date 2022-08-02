local newButton = require("class.button")

local MenuMain = {}

local buttonList = {
	{name = "Test1", func = function() print("test1") end},
	{name = "Test2", func = function() print("test2") end},
	{name = "Test3", func = function() print("test3") end},
	{name = "Test4", func = function() print("test4") end},
}

function MenuMain:load()
	self:generateButtons()
end

local button = {
	width = 100,
	height = 50,
	padding = 5,
}

function MenuMain:generateButtons()
	local x = Settings.ww / 2 - button.width / 2
	local y = Settings.wh / 2 - (button.padding * (#buttonList - 1) + #buttonList * button.height) / 2
	MenuMain.buttons = {}
	for i = 1, #buttonList do
		MenuMain.buttons[i] = newButton.new({
			x        = x,
			y        = y,
			width    = button.width,
			height   = button.height,
			text     = buttonList[i]["name"],
			func     = buttonList[i]["func"],
			font     = Default,
			argument = buttonList[i]["argument"]
		})
		y = y + button.height + button.padding
	end
end

function MenuMain:draw()
	for i = 1, #MenuMain.buttons do
		MenuMain.buttons[i]:draw()
	end
end

function MenuMain:update(dt)
	for i = 1, #MenuMain.buttons do
		MenuMain.buttons[i]:update(dt)
	end
end

function MenuMain:mousepressed(x,y,button,istouch,presses)
	for i = 1, #MenuMain.buttons do
		MenuMain.buttons[i]:mousepressed(x,y,button,istouch,presses)
	end
end

function MenuMain:mousereleased(x,y,button,istouch,presses)
	for i = 1, #MenuMain.buttons do
		MenuMain.buttons[i]:mousereleased(x,y,button,istouch,presses)
	end
end

return MenuMain