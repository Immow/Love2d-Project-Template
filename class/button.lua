local Button = {}
Button.__index = Button

function Button.new(settings)
	local instance = setmetatable({}, Button)
	instance.x            = settings.x or 0
	instance.y            = settings.y or 0
	instance.func         = settings.func
	instance.argument     = settings.argument
	instance.width        = settings.width or 200
	instance.height       = settings.height or 80

	instance.circleX      = 0
	instance.circleY      = 0
	instance.circleRadius = 0
	instance.animate          = false
	instance.speed        = 500
	instance.buttonOffset = settings.buttonOffset or 5

	instance.buttonFillet = settings.buttonFillet or 0
	instance.font         = settings.font or love.graphics.getFont()
	instance.fontSize     = settings.fontSize or 12
	instance.text         = settings.text or ""
	instance.id           = settings.id
	return instance
end

function Button:containsPoint(x, y)
	return x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height
end

function Button:runFunction()
	if self.func then
		self.func(self.argument)
	end
end

function Button:mousepressed(x,y,button,istouch,presses)
	if button == 1 then
		if self:containsPoint(x, y) then
			self.circleX = x
			self.circleY = y
			self.animate = true
			-- Sound:play("click", "click", Settings.sfxVolume, 1)
		end
	end
end

function Button:mousereleased(x,y,button,istouch,presses)
	if self:containsPoint(x, y) then
		self:runFunction()
	end
end

function Button:update(dt)
	if self.animate and self.circleRadius < self.width + self.buttonOffset then
		self.circleRadius = self.circleRadius + self.speed * dt
	end

	if self.circleRadius >= self.width + self.buttonOffset then
		self.animate = false
		self.circleRadius = 0
	end
end

function Button:centerTextX()
	return self.width / 2 - Default:getWidth(self.text) / 2
end

function Button:centerTextY()
	return self.height / 2 - Default:getHeight() / 2
end

function Button:draw()
	love.graphics.setFont(self.font)
	local rec = function()
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.buttonFillet, self.buttonFillet) end
	rec()
	love.graphics.setColor(Colors.gray)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.buttonFillet, self.buttonFillet)
	if self.animate then
		love.graphics.stencil(rec, "replace", 1)
		love.graphics.setStencilTest("greater", 0)
		love.graphics.setColor(Colors.white54)
		love.graphics.circle("fill", self.circleX, self.circleY, self.circleRadius)
		love.graphics.setStencilTest()
	end
	love.graphics.setColor(Colors.black)
	love.graphics.print(self.text, self.x + self:centerTextX(), self.y + self:centerTextY())
end

return Button