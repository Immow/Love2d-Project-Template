function love.conf(t)
	t.title = "My Title"
	t.identity = "My Title"
	t.version = "11.4"
	t.console = true
	t.window.width = 800
	t.window.height = 600
	t.window.msaa = 8
	t.modules.joystick = false
	t.modules.physics = false
	t.externalstorage = true
	t.window.vsync = 1
	t.window.resizable = false
end